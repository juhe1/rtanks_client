package forms.friends
{
   import controls.base.LabelBase;
   import controls.base.name_2016;
   import controls.name_2015;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.name_1139;
   import package_13.Long;
   import package_54.name_102;
   import scpacker.networking.Network;
   
   public class name_2305 extends Sprite
   {
      
      public static var localeService:name_102;
      
      private static const const_1550:int = 600;
      
      public static var var_1335:name_2015;
       
      
      private var var_3004:name_2016;
      
      private var var_3006:LabelBase;
      
      private var var_3005:FriendWindowButton;
      
      private var var_3008:uint;
      
      private var var_3007:String;
      
      private var var_3009:Boolean;
      
      private var var_1345:Long;
      
      private var network:Network;
      
      public function name_2305(param1:Network)
      {
         super();
         this.network = param1;
         this.init();
      }
      
      private function init() : void
      {
         this.var_3004 = new name_2016();
         this.var_3004.maxChars = 20;
         this.var_3004.restrict = "0-9.a-zA-z_\\-*";
         addChild(this.var_3004);
         this.var_3006 = new LabelBase();
         addChild(this.var_3006);
         this.var_3006.mouseEnabled = false;
         this.var_3006.color = name_1139.name_2023;
         this.var_3006.text = "Отправить заявку другу...";
         var_1335 = new name_2015();
         addChild(var_1335);
         this.var_3005 = new FriendWindowButton();
         addChild(this.var_3005);
         this.var_3005.label = "Отправить";
         this.var_3005.enable = false;
         this.resize();
      }
      
      public function resize() : void
      {
         this.var_3004.width = 235;
         this.var_3004.x = FriendsWindow.const_1598;
         this.var_3006.x = this.var_3004.x + 3;
         this.var_3006.y = this.var_3004.y + 7;
         var_1335.x = this.var_3004.x + this.var_3004.width - var_1335.width - 15;
         var_1335.y = this.var_3004.y + 7;
         this.var_3005.width = FriendsWindow.const_1576;
         this.var_3005.x = this.var_3004.width + 8;
      }
      
      public function hide() : void
      {
         clearTimeout(this.var_3008);
         this.method_1476();
         this.method_1564();
         this.visible = false;
      }
      
      private function method_1476() : void
      {
         this.var_3005.removeEventListener(MouseEvent.CLICK,this.method_1562);
         this.var_3004.removeEventListener(FocusEvent.FOCUS_IN,this.method_1563);
         this.var_3004.removeEventListener(FocusEvent.FOCUS_OUT,this.method_1566);
         this.var_3004.textField.removeEventListener(Event.CHANGE,this.method_1567);
         var_1335.removeEventListener("valide",this.valide);
         var_1335.removeEventListener("inValide",this.inValide);
         this.var_3004.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
      }
      
      private function valide(param1:Event) : void
      {
         this.var_3005.enable = true;
      }
      
      private function inValide(param1:Event) : void
      {
         this.var_3005.enable = false;
      }
      
      public function show() : void
      {
         this.visible = true;
         this.method_1568();
         this.var_3004.value = "";
         this.method_1565();
      }
      
      private function method_1568() : void
      {
         this.var_3005.addEventListener(MouseEvent.CLICK,this.method_1562);
         this.var_3004.addEventListener(FocusEvent.FOCUS_IN,this.method_1563);
         this.var_3004.addEventListener(FocusEvent.FOCUS_OUT,this.method_1566);
         this.var_3004.textField.addEventListener(Event.CHANGE,this.method_1567);
         var_1335.addEventListener("valide",this.valide);
         var_1335.addEventListener("inValide",this.inValide);
         this.var_3004.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
      }
      
      private function method_1562(param1:MouseEvent) : void
      {
         this.method_2805();
      }
      
      private function method_2805() : void
      {
         this.network.send("lobby;got_friend;" + this.var_3004.value + ";");
         this.method_1564();
      }
      
      private function method_1564() : void
      {
         this.var_3004.value = "";
         this.var_3005.enable = false;
         var_1335.name_2024();
         this.var_3009 = false;
         this.var_3007 = null;
      }
      
      private function method_1563(param1:FocusEvent) : void
      {
         this.var_3006.visible = false;
      }
      
      private function method_1566(param1:FocusEvent) : void
      {
         this.method_1565();
      }
      
      private function method_1565() : void
      {
         if(this.var_3004.value.length == 0)
         {
            this.var_3006.visible = true;
            var_1335.name_2024();
            this.var_3004.validValue = true;
         }
      }
      
      private function method_1567(param1:Event) : void
      {
         this.var_3009 = false;
         this.var_3005.enable = false;
         if((param1.currentTarget as TextField).text != "")
         {
            this.network.send("lobby;check_user;" + (param1.currentTarget as TextField).text + ";");
         }
         var_1335.method_285();
         var_1335.y = this.var_3004.y + 5;
         if(this.var_3004.value.length > 0)
         {
            this.var_3006.visible = false;
         }
         clearTimeout(this.var_3008);
         this.var_3008 = setTimeout(this.method_1569,600);
      }
      
      private function method_1569() : void
      {
         if(this.var_3004.value.length == 0)
         {
            var_1335.name_2024();
            this.var_3004.validValue = true;
         }
         else
         {
            this.var_3007 = this.var_3004.value;
         }
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.method_2805();
         }
      }
      
      private function method_1521(param1:Boolean) : *
      {
         this.var_3004.validValue = param1;
         if(param1)
         {
            var_1335.name_2027();
         }
         else
         {
            this.var_3007 = null;
            var_1335.name_2017();
            this.var_3005.enable = false;
         }
         var_1335.y = this.var_3004.y + 7;
      }
   }
}
