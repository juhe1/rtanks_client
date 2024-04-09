package package_137
{
   import alternativa.osgi.OSGi;
   import controls.base.LabelBase;
   import controls.base.DefaultButtonBase;
   import controls.buttons.ButtonBase;
   import controls.class_139;
   import controls.name_1922;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import package_280.name_1011;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.name_1015;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.name_1022;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.removeDisplayObject;
   
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
      
      public static const const_1666:int = 16;
      
      public static const const_318:int = 17;
      
      public static const const_1658:int = 18;
      
      public static const CAPTCHA_INCORRECT:int = 19;
      
      public static const const_2058:int = 20;
      
      public static const const_2056:int = 21;
      
      public static const const_2057:int = 22;
       
      
      protected var var_1761:name_1922;
      
      private var var_633:LabelBase;
      
      private var message:String;
      
      private var labels:Vector.<String>;
      
      protected var alertWindow:Sprite;
      
      public var name_983:MainPanelCloseButton;
      
      private var var_2569:Boolean = false;
      
      private const var_1760:Array = [];
      
      private var id:int;
      
      private var localeService:name_102;
      
      private var var_2568:Vector.<Sprite>;
      
      public function Alert(param1:int = -1, param2:Boolean = false)
      {
         this.var_1761 = new name_1922();
         this.alertWindow = new Sprite();
         this.name_983 = new MainPanelCloseButton();
         super();
         this.var_2569 = param2;
         this.id = param1;
         this.init();
      }
      
      public static function method_2545(param1:name_102) : void
      {
         name_358.name_990 = param1.getText(name_390.name_1018);
         name_358.name_1007 = param1.getText(name_390.name_1061);
         name_358.OK = param1.getText(name_390.const_1030);
         name_358.CANCEL = param1.getText(name_390.const_1351);
         name_358.var_885 = param1.getText(name_390.const_1221);
         name_358.var_886 = param1.getText(name_390.const_853);
         name_358.GARAGE = param1.getText(name_390.const_1171);
         name_358.var_888 = param1.getText(name_390.const_818);
         name_358.ENTER = param1.getText(name_390.const_890);
         name_358.var_887 = param1.getText(name_390.const_518);
      }
      
      private function init() : void
      {
         this.localeService = name_102(OSGi.getInstance().getService(name_102));
         this.var_1761.name_2241 = this.localeService.getText(name_390.const_777);
         if(name_358.name_990 == null)
         {
            method_2545(this.localeService);
         }
         this.method_2550(this.localeService);
         if(this.id > -1)
         {
            this.showAlert(this.var_1760[this.id][0],this.var_1760[this.id][1]);
         }
         this.method_2549();
      }
      
      private function method_2550(param1:name_102) : void
      {
         this.var_1760[0] = [param1.getText(name_390.const_571),Vector.<String>([name_358.name_990,name_358.name_1007])];
         this.var_1760[1] = [param1.getText(name_390.const_1098),Vector.<String>([name_358.name_990])];
         this.var_1760[14] = [param1.getText(name_390.const_543),Vector.<String>([name_358.var_886])];
         this.var_1760[15] = [param1.getText(name_390.const_1052),Vector.<String>([name_358.var_885])];
         this.var_1760[2] = [param1.getText(name_390.const_1186),Vector.<String>([name_358.OK])];
         this.var_1760[3] = [param1.getText(name_390.const_859),Vector.<String>([name_358.OK])];
         this.var_1760[4] = [param1.getText(name_390.const_1048),Vector.<String>([name_358.OK])];
         this.var_1760[5] = [param1.getText(name_390.const_1356),Vector.<String>([name_358.OK])];
         this.var_1760[6] = [param1.getText(name_390.const_752),Vector.<String>([name_358.OK])];
         this.var_1760[10] = [param1.getText(name_390.const_811),Vector.<String>([name_358.OK])];
         this.var_1760[11] = [param1.getText(name_390.const_1205),Vector.<String>([name_358.OK])];
         this.var_1760[12] = [param1.getText(name_390.const_1146),Vector.<String>([name_358.OK])];
         this.var_1760[13] = [param1.getText(name_390.const_870),Vector.<String>([name_358.OK])];
         this.var_1760[8] = [param1.getText(name_390.const_699),Vector.<String>([name_358.OK])];
         this.var_1760[7] = [param1.getText(name_390.const_1270),Vector.<String>([name_358.OK])];
         this.var_1760[9] = [param1.getText(name_390.const_1164),Vector.<String>([name_358.OK])];
         this.var_1760[16] = [param1.getText(name_390.const_970),Vector.<String>([name_358.GARAGE,name_358.CANCEL])];
         this.var_1760[17] = [param1.getText(name_390.const_1311),Vector.<String>([name_358.OK])];
         this.var_1760[18] = [param1.getText(name_390.const_1402),Vector.<String>([name_358.CANCEL])];
         this.var_1760[19] = [param1.getText(name_390.const_1267),Vector.<String>([name_358.OK])];
         this.var_1760[20] = [param1.getText(name_390.const_814),Vector.<String>([name_358.OK])];
         this.var_1760[21] = ["Внимание!\nПрежде чем вы сможете закрыть доступ для сервиса ВКонтакте, вам\nнеобходимо установить пароль для аккаунта \"Танков Онлайн\" в настройках.",[name_358.OK]];
         this.var_1760[22] = [param1.getText(name_390.const_521),Vector.<String>([name_358.OK])];
      }
      
      private function method_2549() : void
      {
         this.var_633 = new LabelBase();
         this.var_633.autoSize = TextFieldAutoSize.CENTER;
         this.var_633.align = TextFormatAlign.CENTER;
         this.var_633.size = 14;
         this.var_633.width = 10;
         this.var_633.height = 10;
         this.var_633.x = -5;
         this.var_633.y = 30;
         this.var_633.multiline = true;
      }
      
      public function showAlert(param1:String, param2:Vector.<String>) : void
      {
         this.message = param1;
         this.var_2568 = null;
         this.labels = param2;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      public function name_1056(param1:String, param2:Vector.<String>, param3:Vector.<Sprite>) : void
      {
         this.message = param1;
         this.labels = param2;
         this.var_2568 = param3;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.method_1940(param1);
      }
      
      private function method_2548() : Boolean
      {
         return this.labels.length != 0;
      }
      
      private function method_2552() : Boolean
      {
         return this.var_2568 != null;
      }
      
      protected function method_1940(param1:Event) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:int = 0;
         var _loc4_:DefaultButtonBase = null;
         var _loc5_:int = this.method_1941();
         var _loc6_:int = _loc5_ * this.labels.length / 2;
         addChild(this.alertWindow);
         this.alertWindow.addChild(this.var_1761);
         this.alertWindow.addChild(this.var_633);
         this.var_633.htmlText = this.message;
         if(this.method_2548())
         {
            _loc3_ = 0;
            while(_loc3_ < this.labels.length)
            {
               if(this.method_2552())
               {
                  _loc2_ = this.var_2568[_loc3_];
               }
               else
               {
                  _loc4_ = new DefaultButtonBase();
                  _loc2_ = _loc4_;
                  _loc4_.label = this.labels[_loc3_];
               }
               _loc2_.x = _loc5_ * _loc3_ - _loc6_;
               _loc2_.y = this.var_633.y + this.var_633.height + 15;
               _loc2_.width = _loc5_ - 6;
               _loc2_.addEventListener(MouseEvent.CLICK,this.close);
               this.alertWindow.addChild(_loc2_);
               _loc3_++;
            }
            this.var_1761.height = _loc2_.y + 60;
         }
         else
         {
            this.var_1761.height = this.var_633.y + this.var_633.height + 30;
         }
         this.var_1761.width = Math.max(int(this.var_633.width + 50),_loc6_ * 2 + 50);
         this.var_1761.x = -int(this.var_1761.width / 2) - 3;
         stage.addEventListener(Event.RESIZE,this.method_161);
         stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp,false,name_1015.const_1673);
         stage.focus = this;
         if(this.var_2569)
         {
            this.alertWindow.addChild(this.name_983);
            this.name_983.x = this.var_1761.x + this.var_1761.width - this.name_983.width - 10;
            this.name_983.y = 10;
            this.name_983.addEventListener(MouseEvent.CLICK,this.close);
         }
         this.method_161(null);
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         var _loc2_:String = null;
         switch(this.labels.length)
         {
            case 1:
               if(name_1022.name_1834(param1.keyCode) || name_1022.name_1036(param1.keyCode))
               {
                  _loc2_ = this.labels[0];
               }
               break;
            case 2:
               if(name_1022.name_1834(param1.keyCode))
               {
                  _loc2_ = this.method_2541(this.method_2543());
                  break;
               }
               if(name_1022.name_1036(param1.keyCode))
               {
                  _loc2_ = this.method_2541(this.method_2546());
               }
               break;
            case 3:
               if(name_1022.name_1834(param1.keyCode))
               {
                  _loc2_ = this.method_2541(this.method_2543());
               }
               else if(name_1022.name_1036(param1.keyCode))
               {
                  _loc2_ = this.method_2541(Vector.<String>([name_358.CANCEL]));
               }
         }
         if(_loc2_ != null)
         {
            param1.stopImmediatePropagation();
            this.method_2547(_loc2_);
         }
      }
      
      private function method_2546() : Vector.<String>
      {
         return Vector.<String>([name_358.name_1007,name_358.CANCEL,name_358.var_886,name_358.var_887]);
      }
      
      private function method_2543() : Vector.<String>
      {
         return Vector.<String>([name_358.OK,name_358.name_990,name_358.GARAGE,name_358.var_888,name_358.var_885,name_358.ENTER,this.localeService.getText(name_390.const_584)]);
      }
      
      private function method_2541(param1:Vector.<String>) : String
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this.labels.length)
         {
            _loc2_ = param1.indexOf(this.labels[_loc3_]);
            if(_loc2_ > -1)
            {
               return param1[_loc2_];
            }
            _loc3_++;
         }
         return "";
      }
      
      private function method_2544(param1:Object) : Boolean
      {
         return param1 is ButtonBase || param1 is class_139;
      }
      
      private function method_2542(param1:Object) : String
      {
         if(param1 is ButtonBase)
         {
            return ButtonBase(param1).label;
         }
         if(param1 is class_139)
         {
            return class_139(param1).label;
         }
         return null;
      }
      
      private function method_2547(param1:String) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.alertWindow.numChildren)
         {
            _loc2_ = this.alertWindow.getChildAt(_loc3_);
            if(this.method_2544(_loc2_) && this.method_2542(_loc2_) == param1)
            {
               _loc2_.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
               return;
            }
            _loc3_++;
         }
      }
      
      private function method_1941() : int
      {
         var _loc1_:int = 80;
         var _loc2_:LabelBase = new LabelBase();
         var _loc3_:int = 0;
         while(_loc3_ < this.labels.length)
         {
            _loc2_.text = this.labels[_loc3_];
            if(_loc2_.width > _loc1_)
            {
               _loc1_ = _loc2_.width;
            }
            _loc3_++;
         }
         return _loc1_ + 18;
      }
      
      private function method_161(param1:Event) : void
      {
         this.alertWindow.x = int(stage.stageWidth / 2);
         this.alertWindow.y = int(stage.stageHeight / 2 - this.alertWindow.height / 2);
      }
      
      private function close(param1:MouseEvent) : void
      {
         stage.removeEventListener(Event.RESIZE,this.method_161);
         stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         this.method_2551();
         while(this.alertWindow.numChildren > 0)
         {
            this.alertWindow.removeChildAt(0);
         }
         if(this.method_2544(param1.currentTarget))
         {
            dispatchEvent(new name_1011(this.method_2542(param1.currentTarget)));
         }
         removeDisplayObject(this);
      }
      
      private function method_2551() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.alertWindow.numChildren)
         {
            _loc1_ = this.alertWindow.getChildAt(_loc2_);
            if(_loc1_ == this.name_983)
            {
               _loc1_.removeEventListener(MouseEvent.CLICK,this.close);
            }
            _loc2_++;
         }
      }
      
      public function name_1867() : void
      {
         var _loc1_:String = null;
         if(this.labels.length == 2)
         {
            _loc1_ = this.method_2541(this.method_2546());
         }
         else if(this.labels.length == 1)
         {
            _loc1_ = this.labels[0];
         }
         if(_loc1_ != null)
         {
            this.method_2547(_loc1_);
         }
      }
   }
}
