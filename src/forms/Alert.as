package forms
{
   import controls.DefaultButton;
   import controls.Label;
   import controls.name_1922;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.utils.Timer;
   import package_1.Main;
   import package_280.name_1011;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class Alert extends Sprite
   {
      
      public static const name_1049:int = 0;
      
      public static const const_1667:int = 1;
      
      public static const const_1665:int = 2;
      
      public static const const_1664:int = 3;
      
      public static const const_1662:int = 4;
      
      public static const ERROR_CALLSIGN_LENGTH:int = 5;
      
      public static const const_1661:int = 6;
      
      public static const ERROR_PASSWORD_LENGTH:int = 7;
      
      public static const ERROR_PASSWORD_INCORRECT:int = 8;
      
      public static const ERROR_PASSWORD_CHANGE:int = 9;
      
      public static const const_1668:int = 10;
      
      public static const ERROR_EMAIL_INVALID:int = 11;
      
      public static const const_1663:int = 12;
      
      public static const const_1659:int = 13;
      
      public static const ERROR_FATAL:int = 14;
      
      public static const ERROR_FATAL_DEBUG:int = 15;
      
      public static const const_1660:int = 19;
      
      public static const const_1666:int = 16;
      
      public static const const_318:int = 17;
      
      public static const const_1658:int = 18;
      
      public static const const_1669:int = 18;
      
      public static const const_170:int = 19;
      
      public static const name_1062:int = 20;
       
      
      protected var var_1761:name_1922;
      
      private var var_633:Label;
      
      public var name_1626:String;
      
      private var var_1762:DefaultButton;
      
      private var var_1553:Array;
      
      private var bg:Sprite;
      
      private var var_1747:Bitmap;
      
      protected var alertWindow:Sprite;
      
      public var name_983:MainPanelCloseButton;
      
      private var var_1763:Boolean = false;
      
      private var var_1760:Array;
      
      private var timer:Timer;
      
      public function Alert(param1:int = -1, param2:Boolean = false)
      {
         this.var_1761 = new name_1922();
         this.var_633 = new Label();
         this.bg = new Sprite();
         this.var_1747 = new Bitmap();
         this.alertWindow = new Sprite();
         this.name_983 = new MainPanelCloseButton();
         this.var_1760 = new Array();
         super();
         var _loc3_:name_102 = Main.osgi.getService(name_102) as name_102;
         this.var_1763 = param2;
         this.var_1761.name_2241 = _loc3_.getText(TextConst.GUI_LANG);
         if(name_358.name_990 == null)
         {
            this.method_1942();
         }
         this.var_1760[0] = [_loc3_.getText(TextConst.ALERT_QUIT_TEXT),[name_358.name_990,name_358.name_1007]];
         this.var_1760[1] = [_loc3_.getText(TextConst.ALERT_EMAIL_CONFIRMED),[name_358.name_990]];
         this.var_1760[14] = [_loc3_.getText(TextConst.ERROR_FATAL),[name_358.var_886]];
         this.var_1760[15] = [_loc3_.getText(TextConst.ERROR_FATAL_DEBUG),[name_358.var_885]];
         this.var_1760[2] = [_loc3_.getText(TextConst.ERROR_CALLSIGN_WRONG_FIRST_SYMBOL),[name_358.OK]];
         this.var_1760[3] = [_loc3_.getText(TextConst.ERROR_CALLSIGN_NOT_SINGLE_DEVIDERS),[name_358.OK]];
         this.var_1760[4] = [_loc3_.getText(TextConst.ERROR_CALLSIGN_WRONG_LAST_SYMBOL),[name_358.OK]];
         this.var_1760[5] = [_loc3_.getText(TextConst.ERROR_CALLSIGN_LENGTH),[name_358.OK]];
         this.var_1760[6] = [_loc3_.getText(TextConst.ERROR_CALLSIGN_NOT_UNIQUE),[name_358.OK]];
         this.var_1760[10] = [_loc3_.getText(TextConst.ERROR_EMAIL_NOT_UNIQUE),[name_358.OK]];
         this.var_1760[11] = [_loc3_.getText(TextConst.ERROR_EMAIL_INVALID),[name_358.OK]];
         this.var_1760[12] = [_loc3_.getText(TextConst.ERROR_EMAIL_NOT_FOUND),[name_358.OK]];
         this.var_1760[13] = [_loc3_.getText(TextConst.ERROR_EMAIL_NOT_SENDED),[name_358.OK]];
         this.var_1760[8] = [_loc3_.getText(TextConst.ERROR_PASSWORD_INCORRECT),[name_358.OK]];
         this.var_1760[7] = [_loc3_.getText(TextConst.ERROR_PASSWORD_LENGTH),[name_358.OK]];
         this.var_1760[9] = [_loc3_.getText(TextConst.ERROR_PASSWORD_CHANGE),[name_358.OK]];
         this.var_1760[16] = [_loc3_.getText(TextConst.ALERT_GARAGE_AVAILABLE),[name_358.GARAGE,name_358.CANCEL]];
         this.var_1760[17] = [_loc3_.getText(TextConst.const_318),[name_358.OK]];
         this.var_1760[18] = [_loc3_.getText(TextConst.ALERT_CHAT_PROCEED_EXTERNAL_LINK),[name_358.CANCEL]];
         this.var_1760[19] = [_loc3_.getText(TextConst.const_303),[name_358.OK]];
         this.var_1760[18] = [_loc3_.getText(TextConst.const_179),[name_358.OK]];
         this.var_1760[19] = [_loc3_.getText(TextConst.const_170),[name_358.name_990,name_358.name_1007]];
         this.var_1760[20] = [_loc3_.getText(TextConst.name_1062),[name_358.name_990,name_358.name_1007]];
         if(param1 > -1)
         {
            this.showAlert(this.var_1760[param1][0],this.var_1760[param1][1]);
         }
      }
      
      private function method_1942() : void
      {
         var _loc1_:name_102 = Main.osgi.getService(name_102) as name_102;
         name_358.name_990 = _loc1_.getText(TextConst.ALERT_ANSWER_YES);
         name_358.name_1007 = _loc1_.getText(TextConst.ALERT_ANSWER_NO);
         name_358.OK = _loc1_.getText(TextConst.ALERT_ANSWER_OK);
         name_358.CANCEL = _loc1_.getText(TextConst.ALERT_ANSWER_CANCEL);
         name_358.var_885 = _loc1_.getText(TextConst.ALERT_ANSWER_SEND_BUG_REPORT);
         name_358.var_886 = _loc1_.getText(TextConst.ALERT_ANSWER_RETURN_TO_BATTLE);
         name_358.GARAGE = _loc1_.getText(TextConst.ALERT_ANSWER_GO_TO_GARAGE);
         name_358.var_888 = _loc1_.getText(TextConst.ALERT_ANSWER_PROCEED);
      }
      
      public function showAlert(param1:String, param2:Array) : void
      {
         this.name_1626 = param1;
         this.var_1553 = param2;
         addEventListener(Event.ADDED_TO_STAGE,this.method_1940);
      }
      
      protected function method_1940(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = this.method_1941();
         var _loc3_:int = _loc2_ * this.var_1553.length / 2;
         removeEventListener(Event.ADDED_TO_STAGE,this.method_1940);
         addChild(this.bg);
         this.bg.addChild(this.var_1747);
         addChild(this.alertWindow);
         this.alertWindow.addChild(this.var_1761);
         this.alertWindow.addChild(this.var_633);
         this.var_633.autoSize = TextFieldAutoSize.CENTER;
         this.var_633.align = TextFormatAlign.CENTER;
         this.var_633.size = 13;
         this.var_633.width = 10;
         this.var_633.height = 10;
         this.var_633.x = -5;
         this.var_633.y = 30;
         this.var_633.multiline = true;
         this.var_633.htmlText = this.name_1626;
         if(this.var_1553.length != 0)
         {
            _loc4_ = 0;
            while(_loc4_ < this.var_1553.length)
            {
               this.var_1762 = new DefaultButton();
               this.var_1762.label = this.var_1553[_loc4_];
               this.var_1762.x = _loc2_ * _loc4_ - _loc3_;
               this.var_1762.y = this.var_633.y + this.var_633.height + 15;
               this.var_1762.width = _loc2_ - 6;
               this.var_1762.addEventListener(MouseEvent.CLICK,this.close);
               this.alertWindow.addChild(this.var_1762);
               _loc4_++;
            }
            this.var_1761.height = this.var_1762.y + 60;
         }
         else
         {
            this.var_1761.height = this.var_633.y + this.var_633.height + 30;
         }
         this.var_1761.width = Math.max(int(this.var_633.width + 50),_loc3_ * 2 + 50);
         this.var_1761.x = -int(this.var_1761.width / 2) - 3;
         stage.addEventListener(Event.RESIZE,this.onResize);
         if(this.var_1763)
         {
            this.alertWindow.addChild(this.name_983);
            this.name_983.x = this.var_1761.x + this.var_1761.width - this.name_983.width - 10;
            this.name_983.y = 10;
            this.name_983.addEventListener(MouseEvent.CLICK,this.close);
         }
         this.onResize(null);
      }
      
      private function method_1941() : int
      {
         var _loc1_:int = 80;
         var _loc2_:Label = new Label();
         var _loc3_:int = 0;
         while(_loc3_ < this.var_1553.length)
         {
            _loc2_.text = this.var_1553[_loc3_];
            if(_loc2_.width > _loc1_)
            {
               _loc1_ = _loc2_.width;
            }
            _loc3_++;
         }
         return _loc1_ + 18;
      }
      
      private function drawBg() : void
      {
         var _loc1_:BitmapData = null;
         var _loc2_:BitmapFilter = new BlurFilter(5,5,BitmapFilterQuality.LOW);
         var _loc3_:Array = new Array();
         _loc3_.push(_loc2_);
         _loc1_ = new BitmapData(stage.stageWidth,stage.stageHeight,true,0);
         this.var_1747.visible = false;
         _loc1_.draw(stage);
         this.var_1747.visible = true;
         this.var_1747.filters = _loc3_;
         this.var_1747.bitmapData = _loc1_;
      }
      
      private function onResize(param1:Event) : void
      {
         this.alertWindow.x = int(stage.stageWidth / 2);
         this.alertWindow.y = int(stage.stageHeight / 2 - this.alertWindow.height / 2);
         this.drawBg();
      }
      
      private function close(param1:MouseEvent) : void
      {
         var _loc4_:DisplayObject = null;
         var _loc2_:DefaultButton = param1.currentTarget as DefaultButton;
         stage.removeEventListener(Event.RESIZE,this.onResize);
         var _loc3_:int = 0;
         while(_loc3_ < this.alertWindow.numChildren)
         {
            _loc4_ = this.alertWindow.getChildAt(_loc3_);
            if(_loc4_ is DefaultButton || _loc4_ == this.name_983)
            {
               _loc4_.removeEventListener(MouseEvent.CLICK,this.close);
            }
            _loc3_++;
         }
         if(_loc2_ != null)
         {
            dispatchEvent(new name_1011(_loc2_.label));
         }
         parent.removeChild(this);
      }
   }
}
