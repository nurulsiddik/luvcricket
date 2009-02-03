/*
 * XMLMenuParser.java
 *
 * Created on January 4, 2007, 11:05 AM
 *
 */
package wow.play.cricket.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.Vector;
import org.apache.xerces.parsers.DOMParser;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/**
 * This class parses the xml of screenmenu file and generates the required 
 * javascript for the generation of dynamic screen menu. This parsing is done
 * using DOM.
 * @author Narul.Siddik
 * @version $Revision$
 * Last changed by $Author$ on $Date$ as $Revision$
 */
public class XMLMenuParser
{
    final String HEADMENU_NODE = "headmenunode";
    final String MENUITEM_NODE = "menuitem";
    final String MENUDETAIL_NODE = "menudetails";
    final String TITLE_ATTRIB = "title";
    final String ONCLICK_ATTRIB = "onclick";
    
    Document xmlDoc = null;
    Vector nodeQueue = new Vector();
    String menuJavaScript = "";
    int currentArray = 0;
    int currentRunningArray = 0;
    /**
     * Creates a new instance of XMLMenuParser
     * @param screenXml URL of the screen menu xml
     */
    public XMLMenuParser(String screenXml)
    {
        try
        {
            LCLogger.debug(" SCREEN MENU PARSER : "+screenXml);
            DOMParser parser = new DOMParser();
            InputStream xmlFile = this.getClass().getClassLoader().getResourceAsStream(screenXml);
            System.out.println("XMLFILE: "+xmlFile);
            InputSource xmlIS = new InputSource(xmlFile);
            parser.parse(xmlIS);
            xmlDoc = parser.getDocument();
        }
        catch (SAXException ex)
        {
            ex.printStackTrace();
        }
        catch (IOException ex)
        {
            ex.printStackTrace();
        }
    }
    
    /**
     * This function initiates the parsing of the xml and returns the string which is
     * actually a dynamically generated java script required for the menu.
     * @return java script code required to generate the screen menu.
     */
    public String parseScreenMenu()
    {
        Element rootElement = xmlDoc.getDocumentElement();
        menuJavaScript += "<link type='text/css' rel='stylesheet' href='/LuvCricket/css/menu.css'/>";
        menuJavaScript += "<script language='JavaScript1.2' src='/LuvCricket/js/menuapi.js' type='text/javascript'></script>\n"
                       +  "<script language='JavaScript1.2' src='/LuvCricket/js/menucode.js' type='text/javascript'></script>\n\n"; 
                        
        menuJavaScript += "<script language='JavaScript1.2' type='text/javascript'>\n"
                      // +  "try{ \n" 
                       +  "sniffBrowsers();\n"
                      // +  "}\ncatch('ex')\n{\n alert('exception')\n}\n"  
                       +  "menuItemBullet = new bulletPoint('/LuvCricket/images/menu_off.gif','/LuvCricket/images/menu_on.gif');\n"
                       +  "labelBullet = new bulletPoint('/LuvCricket/images/header_off.gif','/LuvCricket/images/header_on.gif');\n"
                       +  "subMenuBullet = new bulletPoint('/LuvCricket/images/sub_header_off.gif','/LuvCricket/images/sub_header_on.gif');\n\n";
        
        menuJavaScript += "screenMenu = new menuBar('screenMenu',480, 'horizontal', '#000000', '#000000');\n";
        
        NodeList headMenuNodeList = rootElement.getElementsByTagName(HEADMENU_NODE);
        int headMenuNodeCount = headMenuNodeList.getLength();
        for(int i=0 ; i<headMenuNodeCount; i++)
        {
            Node headMenuNode = headMenuNodeList.item(i);
            currentArray++;
            processHeadMenu(headMenuNode);
        }
        
        menuJavaScript += "\n\n screenMenu.height = 14;\n"
                      // +"}\ncatch('ex'){}"  
                       +"\n</script>";
        
        return menuJavaScript;
    }
    
    /**
     * This function process the head menu nodes
     * @param headNode Head node
     */
    private void processHeadMenu(Node headNode)
    {
        NodeList headChildList = headNode.getChildNodes();
        
        //Attributes of Head node
        int headChildCount = headChildList.getLength();
        for(int i=0 ; i<headChildCount; i++)
        {
            Node headChildNode = headChildList.item(i);
            if(MENUDETAIL_NODE.equals(headChildNode.getNodeName()))
            {
                String title = "";
                String onClick = "javascript:fnDummy();";

                NamedNodeMap nodeAttrib = headChildNode.getAttributes();
                
                // title attribute
                Node titleAttribNode = nodeAttrib.getNamedItem(TITLE_ATTRIB);
                if(titleAttribNode != null)
                {
                    title = titleAttribNode.getNodeValue();                
                }
                
                // onclick attribute
                Node onclickAttribNode = nodeAttrib.getNamedItem(ONCLICK_ATTRIB);
                if(onclickAttribNode != null)
                {
                    onClick = onclickAttribNode.getNodeValue();
                }
                
                menuJavaScript += "screenMenu.addLabel('labelBullet', '"+title+"',"+currentArray+" , 120, '#6666ff','#0000aa', '"+onClick+"', 'left');\n";
                menuJavaScript += "menus["+currentArray+"] = new menu(135, 'vertical', '#000000', '#000000');\n"
                               +  "menus["+currentArray+"].height = 16;\n";;
            }
            
            if(MENUITEM_NODE.equals(headChildNode.getNodeName()))
            {
                processMenuItems(headChildNode);
            }
        }
        
        menuJavaScript += "menus["+currentArray+"].writeMenu();\n"
                +"menus["+currentArray+"].align='left';\n\n";
        
        //processing the queued node of this level
        processQueues();
    }
    
    /**
     * This function process the menu items node.
     * @param menuNode menu item node
     */
    private void processMenuItems(Node menuNode)
    {
        NodeList menuItemNodeList = menuNode.getChildNodes();
        boolean menuItemFlag = false;
        
        if(getChildNodesByName(menuNode,MENUITEM_NODE) > 0)
        {
            if(currentRunningArray < currentArray)
            {
                currentRunningArray = currentArray;
            }
            currentRunningArray++;
            menuItemFlag = true;
            nodeQueue.add(menuNode);
        }
        
        int menuItemNodeCount = menuItemNodeList.getLength();
        for(int i=0 ; i<menuItemNodeCount; i++)
        {
            Node menuItemNode = menuItemNodeList.item(i);
            if(MENUDETAIL_NODE.equals(menuItemNode.getNodeName()))
            {
                String title = "";
                String onClick = "javascript:fnDummy();";

                NamedNodeMap nodeAttrib = menuItemNode.getAttributes();
                
                // title attribute
                Node titleAttribNode = nodeAttrib.getNamedItem(TITLE_ATTRIB);
                if(titleAttribNode != null)
                {
                    title = titleAttribNode.getNodeValue();                
                }
                
                // onclick attribute
                Node onclickAttribNode = nodeAttrib.getNamedItem(ONCLICK_ATTRIB);
                if(onclickAttribNode != null)
                {
                    onClick = onclickAttribNode.getNodeValue();
                }
                
                String menuIcon = "menuItemBullet";
                String subMenuIndex = "null";
                if(menuItemFlag)
                {
                    menuIcon = "subMenuBullet";
                    subMenuIndex = currentRunningArray+"";
                }
        
                menuJavaScript += "menus["+currentArray+"].addItem('"+menuIcon+"', '"+title+"', "+subMenuIndex
                               +", 135, '#6666ff', '#0000aa', '"+onClick+"', 'left'); \n";
            }
        }
    }
    
    /**
     * While processing menu nodes if the menu node contains the child menuitem nodes
     * then this are queued so that it can be processed after a current level of nodes
     * are processed.This function processes all the queued nodes
     */
    private void processQueues()
    {
        if(!nodeQueue.isEmpty())
        {
            currentArray++;
            Node menuNode = (Node)nodeQueue.remove(0);
            NodeList menuItemNodeList = menuNode.getChildNodes();
            
            menuJavaScript += "menus["+currentArray+"] = new menu(135, 'vertical', '#000000', '#000000');\n"
                    +  "menus["+currentArray+"].height = 16;\n";
            
            int menuItemNodeCount = menuItemNodeList.getLength();
            for(int i=0 ; i<menuItemNodeCount; i++)
            {
                processMenuItems(menuItemNodeList.item(i));
            }
            
            menuJavaScript += "menus["+currentArray+"].writeMenu();\n"
                    +"menus["+currentArray+"].align='right';\n\n";
            
            if(!nodeQueue.isEmpty())
            {
                processQueues();
            }
        }
    }
    
    /**
     * This function returns the number of child nodes with the name supplied.
     * @param objNode Node for which childs are to be searched
     * @param nodeName Name of the child to be searched.
     * @return number of child searched.
     */
    private int getChildNodesByName(Node objNode,String nodeName)
    {
        int count = 0;
        NodeList objNodeList = objNode.getChildNodes();
        
        int objNodeListCount = objNodeList.getLength();
        for(int i=0 ; i<objNodeListCount; i++)
        {
            Node tempNode = objNodeList.item(i);
            if(nodeName.equals(tempNode.getNodeName()))
            {
                count++;
            }
        }
        return count;
    }
    
    /**
     * This function generates html code for generating screen menu.
     * It is important to call parseScreenMenu function to parse screen
     * menu xml before calling this function.
     * @return html code calling screen menu generator.
     */
    public String generateScreenMenu()
    {
        String htmlScreenMenu ="<TABLE border=\"1\">\n"
                +"<TR>\n"
                +"<TD>\n"
                +"<script language=\"JavaScript1.2\" type=\"text/javascript\">\n"
                +"screenMenu.writeMenuBar();\n"
                +"</script>\n"
                +"</TD>\n"    
                +"</TR>\n"
                +"</TABLE>\n";
                
        return htmlScreenMenu;
    }
}
