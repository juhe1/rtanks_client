package alternativa.tanks.gui
{
   import assets.icons.name_2294;
   import assets.name_2295;
   import controls.DefaultButton;
   import controls.Label;
   import controls.TankInput;
   import controls.name_1891;
   import controls.name_1922;
   import controls.name_2292;
   import controls.name_2296;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.system.System;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import forms.RegisterForm;
   import package_1.Main;
   import package_282.name_1851;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_415.ReferralStatList;
   import package_415.ReferralWindowBigButton;
   import package_54.name_102;
   import package_60.TextConst;
   import package_60.name_1822;
   import package_7.name_32;
   
   public class NewReferalWindow extends Sprite
   {
      
      private static const const_1682:Class;
      
      private static const const_1681:BitmapData = new const_1682().bitmapData;
      
      private static const const_1684:Class;
      
      private static const const_1680:BitmapData = new const_1684().bitmapData;
      
      private static const const_1683:Class;
      
      private static const const_1678:BitmapData = new const_1683().bitmapData;
      
      private static const const_1685:Class;
      
      private static const const_1679:BitmapData = new const_1685().bitmapData;
       
      
      private var localeService:name_102;
      
      private var var_1815:ReferralWindowBigButton;
      
      private var var_1821:ReferralWindowBigButton;
      
      private var var_1824:ReferralWindowBigButton;
      
      public var name_983:DefaultButton;
      
      public var var_1818:name_2293;
      
      private var var_1838:DefaultButton;
      
      private var var_1834:DefaultButton;
      
      private var var_1844:DefaultButton;
      
      private var window:name_1922;
      
      private var var_1251:name_1891;
      
      private var var_1811:name_1891;
      
      private var var_1831:name_1891;
      
      private var var_1833:name_1891;
      
      private var var_1823:name_1891;
      
      private var var_1813:name_1891;
      
      private var var_1846:Bitmap;
      
      private var var_1843:Bitmap;
      
      public var var_1840:ReferralStatList;
      
      private var var_1835:Sprite;
      
      private var var_1845:Sprite;
      
      private var var_1819:Sprite;
      
      private var var_1822:Sprite;
      
      private var var_1816:Sprite;
      
      private var var_1817:DisplayObject;
      
      private var var_1825:name_2294;
      
      private var var_1826:Label;
      
      private var var_1812:Label;
      
      private var var_1836:TankInput;
      
      private var var_1830:name_2292;
      
      private var var_1828:Label;
      
      public var var_1810:TankInput;
      
      private var var_1837:Label;
      
      private var var_1842:Label;
      
      private var var_1820:TankInput;
      
      private var var_1814:name_2292;
      
      private var var_1829:Label;
      
      private var var_1832:Label;
      
      private var var_1827:Label;
      
      private var var_1839:Label;
      
      private var loader:Loader;
      
      public var name_1029:Point;
      
      private const const_1692:int = 12;
      
      private const var_1750:int = 9;
      
      private const const_1688:int = 4;
      
      private const const_1677:Point = new Point(104,33);
      
      private const bannerSize:Point = new Point(468,120);
      
      private const space:int = 0;
      
      private var state:int;
      
      private const const_1690:int = 0;
      
      private const const_1687:int = 1;
      
      private const const_1691:int = 2;
      
      private const const_1689:int = 3;
      
      private const const_1693:int = 4;
      
      private var messageTemplate:String;
      
      private var panelModel:name_115;
      
      private const const_1686:int = 104;
      
      public var var_1841:name_2295;
      
      public function NewReferalWindow(param1:String, param2:String, param3:String, param4:String)
      {
         var modelRegister:name_32;
         var headerBd:BitmapData;
         var context:LoaderContext;
         var tableLinkURL:String = null;
         var hash:String = param1;
         var bannerCodeString:String = param2;
         var url:String = param3;
         var messageTemplate:String = param4;
         super();
         this.messageTemplate = messageTemplate.split("\n\r").join("\n").split("\r\n").join("\n");
         this.localeService = Main.osgi.name_6(name_102) as name_102;
         modelRegister = Main.osgi.name_6(name_32) as name_32;
         this.panelModel = Main.osgi.name_6(name_115) as PanelModel;
         this.window = new name_1922();
         addChild(this.window);
         this.window.name_2241 = this.localeService.getText(TextConst.GUI_LANG);
         this.window.header = name_2296.name_2299;
         this.var_1815 = new ReferralWindowBigButton();
         this.var_1815.icon = const_1678;
         addChild(this.var_1815);
         this.var_1815.label = this.localeService.getText(TextConst.REFERAL_WINDOW_BUTTON_GET_LINK_TEXT);
         this.var_1815.addEventListener(MouseEvent.CLICK,this.method_2005);
         this.var_1821 = new ReferralWindowBigButton();
         this.var_1821.icon = const_1679;
         addChild(this.var_1821);
         this.var_1821.label = this.localeService.getText(TextConst.REFERAL_WINDOW_BUTTON_GET_BANNER_TEXT);
         this.var_1821.addEventListener(MouseEvent.CLICK,this.onBannerClick);
         this.var_1824 = new ReferralWindowBigButton();
         this.var_1824.icon = const_1680;
         addChild(this.var_1824);
         this.var_1824.label = this.localeService.getText(TextConst.REFERAL_WINDOW_BUTTON_INVITE_BY_EMAIL_TEXT);
         this.var_1824.addEventListener(MouseEvent.CLICK,this.method_2006);
         this.var_1818 = new name_2293();
         addChild(this.var_1818);
         this.var_1818.label = this.localeService.getText(TextConst.REFERAL_WINDOW_BUTTON_STATISTICS_TEXT);
         this.var_1818.addEventListener(MouseEvent.CLICK,this.method_2007);
         this.name_983 = new DefaultButton();
         addChild(this.name_983);
         this.name_983.label = this.localeService.getText(TextConst.REFERAL_WINDOW_BUTTON_CLOSE_TEXT);
         this.var_1813 = new name_1891(0,0,name_1891.name_1428);
         this.var_1813.x = 12;
         this.var_1813.y = 12;
         addChild(this.var_1813);
         this.var_1813.visible = false;
         this.var_1812 = new Label();
         this.var_1812.color = 381208;
         this.var_1812.multiline = true;
         this.var_1812.wordWrap = true;
         addChild(this.var_1812);
         this.var_1812.visible = false;
         this.var_1251 = new name_1891(0,0,name_1891.name_2114);
         this.var_1251.x = 12;
         addChild(this.var_1251);
         this.var_1251.visible = false;
         this.var_1835 = new Sprite();
         addChild(this.var_1835);
         this.var_1811 = new name_1891(0,0,name_1891.name_1428);
         this.var_1811.x = 12;
         this.var_1811.y = 12;
         this.var_1835.addChild(this.var_1811);
         headerBd = this.localeService.getImage(name_1822.const_1509);
         this.var_1846 = new Bitmap(headerBd);
         this.var_1835.addChild(this.var_1846);
         this.var_1843 = new Bitmap(const_1681);
         this.var_1835.addChild(this.var_1843);
         this.var_1826 = new Label();
         this.var_1826.color = 381208;
         this.var_1826.multiline = true;
         this.var_1826.wordWrap = true;
         this.var_1835.addChild(this.var_1826);
         switch(this.localeService.language)
         {
            case "ru":
               tableLinkURL = "http://forum.tankionline.com/posts/list/3210.page";
               break;
            case "en":
               tableLinkURL = "http://forum.tankionline.com/posts/list/1150.page";
               break;
            case "cn":
               tableLinkURL = "http://3dtank.com";
               break;
            default:
               tableLinkURL = "";
         }
         this.var_1826.htmlText = this.localeService.getText(TextConst.REFERAL_WINDOW_INFO_TEXT,tableLinkURL);
         this.var_1816 = new Sprite();
         addChild(this.var_1816);
         this.var_1831 = new name_1891(0,0,name_1891.name_1428);
         this.var_1816.addChild(this.var_1831);
         this.var_1833 = new name_1891(0,0,name_1891.name_1428);
         this.var_1816.addChild(this.var_1833);
         this.var_1823 = new name_1891(0,0,name_1891.name_1428);
         this.var_1816.addChild(this.var_1823);
         this.var_1832 = new Label();
         this.var_1832.text = this.localeService.getText(TextConst.REFERAL_WINDOW_COUNT_LABEL);
         this.var_1816.addChild(this.var_1832);
         this.var_1829 = new Label();
         this.var_1829.autoSize = TextFieldAutoSize.RIGHT;
         this.var_1829.color = 381208;
         this.var_1829.text = "0";
         this.var_1816.addChild(this.var_1829);
         this.var_1839 = new Label();
         this.var_1839.text = this.localeService.getText(TextConst.REFERAL_WINDOW_SUMMARY_LABEL);
         this.var_1816.addChild(this.var_1839);
         this.var_1841 = new name_2295();
         this.var_1816.addChild(this.var_1841);
         this.var_1827 = new Label();
         this.var_1827.autoSize = TextFieldAutoSize.RIGHT;
         this.var_1827.color = 381208;
         this.var_1827.text = "0";
         this.var_1816.addChild(this.var_1827);
         this.var_1840 = new ReferralStatList();
         this.var_1816.addChild(this.var_1840);
         this.var_1845 = new Sprite();
         addChild(this.var_1845);
         this.var_1836 = new TankInput();
         this.var_1836.textField.type = TextFieldType.DYNAMIC;
         this.var_1845.addChild(this.var_1836);
         this.var_1836.textField.text = url;
         this.var_1838 = new DefaultButton();
         this.var_1845.addChild(this.var_1838);
         this.var_1838.width = 220;
         this.var_1838.label = this.localeService.getText(TextConst.REFERAL_WINDOW_BUTTON_COPY_LINK_TEXT);
         this.var_1838.addEventListener(MouseEvent.CLICK,this.method_2003);
         this.var_1819 = new Sprite();
         addChild(this.var_1819);
         context = new LoaderContext(false,new ApplicationDomain());
         this.loader = new Loader();
         this.loader.load(new URLRequest("http://" + this.localeService.getText(TextConst.name_1044) + "/tankiref.swf?hash=" + hash + "&server=" + this.localeService.getText(TextConst.name_1044)),context);
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.method_2002);
         this.var_1817 = new Sprite();
         this.var_1819.addChild(this.var_1817);
         with(this.var_1817 as Sprite)
         {
            graphics.beginFill(0,0.5);
            graphics.drawRect(0,0,bannerSize.x,bannerSize.y);
         }
         this.var_1825 = new name_2294();
         this.var_1825.gotoAndStop(RegisterForm.name_2297);
         this.var_1819.addChild(this.var_1825);
         this.var_1830 = new name_2292();
         this.var_1830.name_2291.text = bannerCodeString;
         this.var_1819.addChild(this.var_1830);
         this.var_1834 = new DefaultButton();
         this.var_1819.addChild(this.var_1834);
         this.var_1834.label = this.localeService.getText(TextConst.REFERAL_WINDOW_BUTTON_COPY_BANNER_TEXT);
         this.var_1834.addEventListener(MouseEvent.CLICK,this.method_2009);
         this.var_1834.width = 200;
         this.var_1822 = new Sprite();
         addChild(this.var_1822);
         this.var_1828 = new Label();
         this.var_1828.multiline = true;
         this.var_1828.wordWrap = true;
         this.var_1828.htmlText = this.localeService.getText(TextConst.INVITATION_SENDER_NAME_LABEL_TEXT);
         this.var_1822.addChild(this.var_1828);
         this.var_1810 = new TankInput();
         this.var_1810.textField.type = TextFieldType.INPUT;
         this.var_1822.addChild(this.var_1810);
         this.var_1810.textField.text = this.panelModel.userName;
         this.var_1810.textField.addEventListener(Event.CHANGE,this.method_2008);
         this.var_1837 = new Label();
         this.var_1837.multiline = true;
         this.var_1837.wordWrap = true;
         this.var_1837.htmlText = this.localeService.getText(TextConst.REFERAL_WINDOW_EMAIL_LABEL_TEXT);
         this.var_1822.addChild(this.var_1837);
         this.var_1820 = new TankInput();
         this.var_1822.addChild(this.var_1820);
         this.var_1842 = new Label();
         this.var_1842.htmlText = this.localeService.getText(TextConst.REFERAL_WINDOW_LETTER_LABEL_TEXT);
         this.var_1822.addChild(this.var_1842);
         this.var_1814 = new name_2292();
         this.var_1814.name_2291.type = TextFieldType.DYNAMIC;
         this.var_1814.name_2291.text = this.messageTemplate.replace("%1",this.panelModel.userName);
         this.var_1822.addChild(this.var_1814);
         this.var_1844 = new DefaultButton();
         this.var_1822.addChild(this.var_1844);
         this.var_1844.label = this.localeService.getText(TextConst.REFERAL_WINDOW_BUTTON_SEND_TEXT);
         this.var_1844.addEventListener(MouseEvent.CLICK,this.method_2004);
         this.name_1029 = new Point(468 + 12 * 2 + 4,492);
         this.window.width = this.name_1029.x;
         this.window.height = this.name_1029.y;
         this.var_1813.width = this.name_1029.x - 12 * 2;
         this.var_1813.height = 75;
         this.var_1812.x = this.var_1813.x + 9;
         this.var_1812.y = this.var_1813.y + 9;
         this.var_1812.width = this.name_1029.x - 12 * 2 - 9 * 2;
         this.var_1251.y = this.var_1813.y + this.var_1813.height + 9;
         this.var_1251.width = this.name_1029.x - 12 * 2;
         this.var_1251.height = this.name_1029.y - 104 - 9 - this.var_1251.y;
         this.var_1811.width = this.name_1029.x - 12 * 2;
         this.var_1811.height = this.name_1029.y - 12 - 104 - 9;
         this.var_1846.x = this.var_1811.x + int((this.var_1811.width - this.var_1846.width) * 0.5);
         this.var_1846.y = this.var_1811.y + 9 * 2;
         this.var_1843.x = this.var_1811.x + int((this.var_1811.width - this.var_1843.width) * 0.5);
         this.var_1843.y = this.var_1811.y + int(this.var_1811.height * (1 - 0.618) - this.var_1843.height * 0.5);
         this.var_1826.x = this.var_1811.x + 9;
         this.var_1826.width = this.name_1029.x - 12 * 2 - 9 * 2;
         this.var_1826.y = this.var_1811.y + this.var_1811.height - this.var_1826.height - 9 * 2;
         this.var_1832.x = 12;
         this.var_1833.width = 100;
         this.var_1833.height = 26;
         this.var_1833.x = this.var_1832.x + this.var_1832.width + 9;
         this.var_1833.y = 12;
         this.var_1829.x = this.var_1833.x + this.var_1833.width - 9 - this.var_1829.width;
         this.var_1832.y = 12 + int((this.var_1833.height - this.var_1832.height) * 0.5);
         this.var_1829.y = this.var_1832.y;
         this.var_1823.width = 100;
         this.var_1823.height = 26;
         this.var_1823.x = this.name_1029.x - 12 - this.var_1823.width;
         this.var_1823.y = 12;
         this.var_1839.x = this.var_1823.x - 9 - this.var_1839.width;
         this.var_1841.x = this.name_1029.x - 12 - 9 - this.var_1841.width;
         this.var_1827.x = this.var_1841.x - 2 - this.var_1827.width;
         this.var_1839.y = 12 + int((this.var_1823.height - this.var_1839.height) * 0.5);
         this.var_1827.y = this.var_1839.y;
         this.var_1841.y = 12 + int((this.var_1823.height - this.var_1841.height) * 0.5);
         this.var_1831.x = 12;
         this.var_1831.y = 12 + 9 + this.var_1823.height - 3;
         this.var_1831.width = this.name_1029.x - 12 * 2;
         this.var_1831.height = this.name_1029.y - this.var_1831.y - 104 - 9 + 1;
         this.var_1840.x = 12 + 4;
         this.var_1840.y = this.var_1831.y + 4;
         this.var_1836.width = this.name_1029.x - 12 * 2 - 9 * 2;
         this.var_1836.x = this.var_1251.x + 9;
         this.var_1836.y = this.var_1251.y + 9;
         this.var_1838.x = this.name_1029.x - this.var_1838.width >> 1;
         this.var_1838.y = this.var_1251.y + 9 * 2 + this.const_1677.y;
         this.var_1844.x = this.name_1029.x - 12 - 9 - this.const_1677.x + 8;
         this.var_1844.y = this.var_1251.y + this.var_1251.height - 9 - this.const_1677.y;
         this.var_1828.x = this.var_1251.x + 9;
         this.var_1810.y = this.var_1251.y + 9;
         this.var_1828.width = 100;
         this.var_1810.x = this.var_1828.x + 100;
         this.var_1828.y = this.var_1810.y;
         this.var_1810.width = this.name_1029.x - 12 - 9 - this.var_1810.x;
         this.var_1820.x = this.var_1810.x;
         this.var_1820.y = Math.round(this.var_1810.y + this.var_1810.height + 9);
         this.var_1820.width = this.name_1029.x - 12 - 9 - this.var_1810.x;
         this.var_1814.x = this.var_1810.x;
         this.var_1814.y = Math.round(this.var_1820.y + this.var_1820.height + 9);
         this.var_1814.width = this.name_1029.x - 12 - 9 - this.var_1810.x;
         this.var_1814.height = Math.round(this.var_1251.y + this.var_1251.height - this.var_1814.y - 9 * 2 - this.const_1677.y);
         this.var_1842.x = this.var_1251.x + 9;
         this.var_1842.y = this.var_1814.y;
         this.var_1842.width = 100;
         this.var_1837.x = this.var_1251.x + 9;
         this.var_1837.y = this.var_1820.y;
         this.var_1837.width = 100;
         this.var_1814.name_2291.type = TextFieldType.DYNAMIC;
         this.var_1815.x = (this.name_1029.x - this.var_1815.width >> 1) + 3;
         this.var_1815.y = this.name_1029.y - 104;
         this.var_1824.x = 12;
         this.var_1824.y = this.name_1029.y - 104;
         this.var_1821.x = this.var_1815.x + this.var_1815.width - 4;
         this.var_1821.y = this.name_1029.y - 104;
         this.name_983.x = this.name_1029.x - 12 - this.const_1677.x + 8;
         this.name_983.y = this.name_1029.y - 12 - this.const_1677.y;
         this.var_1818.x = 12;
         this.var_1818.y = this.name_983.y;
         this.var_1818.width = 240;
         this.method_2001();
         this.method_2000();
         this.state = 0;
         this.var_1835.visible = true;
      }
      
      public function name_1037(param1:Array) : void
      {
         var _loc2_:int = 0;
         this.var_1829.text = param1.length.toString();
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ += name_1851(param1[_loc3_]).income;
            _loc3_++;
         }
         this.var_1827.text = _loc2_.toString();
         this.var_1818.label = this.localeService.getText(TextConst.REFERAL_WINDOW_BUTTON_STATISTICS_TEXT) + " " + _loc2_.toString();
         this.var_1840.name_2300(param1);
         this.var_1840.width = this.name_1029.x - 12 * 2 - 4 * 2 + 2;
         this.var_1840.height = this.name_1029.y - this.var_1831.y - 104 - 9 - 4 * 2;
      }
      
      private function method_2008(param1:Event) : void
      {
         if(Boolean(this.var_1810.textField.text.length))
         {
            this.var_1814.name_2291.text = this.messageTemplate.replace("%1",this.var_1810.textField.text);
         }
         else
         {
            this.var_1814.name_2291.text = this.messageTemplate.replace("%1",this.panelModel.userName);
         }
      }
      
      private function method_2002(param1:Event) : void
      {
         this.var_1825.gotoAndStop(RegisterForm.name_2298);
         this.var_1819.removeChild(this.var_1825);
         this.var_1819.removeChild(this.var_1817);
         this.var_1817 = this.loader as DisplayObject;
         this.var_1819.addChildAt(this.var_1817,0);
         this.method_2001();
      }
      
      private function method_2001() : void
      {
         this.var_1817.x = this.var_1251.x + 2;
         this.var_1817.y = this.var_1251.y + 2;
         this.var_1834.x = this.name_1029.x - this.var_1834.width >> 1;
         this.var_1834.y = this.var_1251.y + this.var_1251.height - 9 - this.const_1677.y;
         this.var_1830.x = 12 + 9;
         this.var_1830.y = this.var_1817.y + this.var_1817.height + 9;
         this.var_1830.width = this.name_1029.x - 12 * 2 - 9 * 2;
         this.var_1830.height = this.var_1834.y - 9 - this.var_1830.y;
         if(this.var_1819.contains(this.var_1825))
         {
            this.var_1825.x = this.var_1817.x + int((this.bannerSize.x - this.var_1825.width) * 0.5);
            this.var_1825.y = this.var_1817.y + int((this.bannerSize.y - this.var_1825.height) * 0.5);
         }
      }
      
      private function method_2000() : void
      {
         this.var_1835.visible = false;
         this.var_1845.visible = false;
         this.var_1819.visible = false;
         this.var_1822.visible = false;
         this.var_1816.visible = false;
      }
      
      private function method_2007(param1:MouseEvent) : void
      {
         this.var_1815.enable = true;
         this.var_1821.enable = true;
         this.var_1824.enable = true;
         this.var_1818.enable = false;
         this.method_2000();
         this.state = 4;
         this.var_1816.visible = true;
         this.var_1813.visible = false;
         this.var_1251.visible = false;
         this.var_1812.visible = false;
      }
      
      private function method_2005(param1:MouseEvent) : void
      {
         this.var_1815.enable = false;
         this.var_1821.enable = true;
         this.var_1824.enable = true;
         this.var_1818.enable = true;
         this.method_2000();
         this.state = 1;
         this.var_1845.visible = true;
         this.var_1813.visible = true;
         this.var_1251.visible = true;
         this.var_1812.visible = true;
         this.var_1812.text = this.localeService.getText(TextConst.REFERAL_WINDOW_LINK_DESCRIPTION);
      }
      
      private function onBannerClick(param1:MouseEvent) : void
      {
         this.var_1815.enable = true;
         this.var_1821.enable = false;
         this.var_1824.enable = true;
         this.var_1818.enable = true;
         this.method_2000();
         this.state = 2;
         this.var_1819.visible = true;
         this.var_1813.visible = true;
         this.var_1251.visible = true;
         this.var_1812.visible = true;
         this.var_1812.text = this.localeService.getText(TextConst.REFERAL_WINDOW_BANNER_DESCRIPTION);
      }
      
      private function method_2006(param1:MouseEvent) : void
      {
         this.var_1815.enable = true;
         this.var_1821.enable = true;
         this.var_1824.enable = false;
         this.var_1818.enable = true;
         this.method_2000();
         this.state = 3;
         this.var_1822.visible = true;
         this.var_1813.visible = true;
         this.var_1251.visible = true;
         this.var_1812.visible = true;
         this.var_1812.text = this.localeService.getText(TextConst.REFERAL_WINDOW_MAIL_DESCRIPTION);
      }
      
      private function method_2003(param1:MouseEvent) : void
      {
         System.setClipboard(this.var_1836.textField.text);
      }
      
      private function method_2009(param1:MouseEvent) : void
      {
         System.setClipboard(this.var_1830.name_2291.text);
      }
      
      private function method_2004(param1:MouseEvent) : void
      {
         dispatchEvent(new name_991(name_991.name_1023,this.var_1820.value,this.var_1814.text));
      }
      
      public function name_1043() : void
      {
         if(this.var_1820 != null)
         {
            this.var_1820.value = "";
         }
      }
   }
}
