package package_129
{
   import package_114.ChatModeratorLevel;
   
   public class name_349
   {
       
      
      private var var_853:Boolean;
      
      private var var_855:Boolean;
      
      private var var_852:int;
      
      private var var_849:Vector.<String>;
      
      private var var_854:Boolean;
      
      private var var_845:ChatModeratorLevel;
      
      private var var_844:Vector.<String>;
      
      private var var_846:int;
      
      private var var_850:int;
      
      private var var_848:Boolean;
      
      private var var_851:String;
      
      private var var_847:Boolean;
      
      private var var_857:Boolean;
      
      private var var_856:int;
      
      private var var_858:int;
      
      public function name_349(param1:Boolean = false, param2:Boolean = false, param3:int = 0, param4:Vector.<String> = null, param5:Boolean = false, param6:ChatModeratorLevel = null, param7:Vector.<String> = null, param8:int = 0, param9:int = 0, param10:Boolean = false, param11:String = null, param12:Boolean = false, param13:Boolean = false, param14:int = 0, param15:int = 0)
      {
         super();
         this.var_853 = param1;
         this.var_855 = param2;
         this.var_852 = param3;
         this.var_849 = param4;
         this.var_854 = param5;
         this.var_845 = param6;
         this.var_844 = param7;
         this.var_846 = param8;
         this.var_850 = param9;
         this.var_848 = param10;
         this.var_851 = param11;
         this.var_847 = param12;
         this.var_857 = param13;
         this.var_856 = param14;
         this.var_858 = param15;
      }
      
      public function get admin() : Boolean
      {
         return this.var_853;
      }
      
      public function set admin(param1:Boolean) : void
      {
         this.var_853 = param1;
      }
      
      public function get antifloodEnabled() : Boolean
      {
         return this.var_855;
      }
      
      public function set antifloodEnabled(param1:Boolean) : void
      {
         this.var_855 = param1;
      }
      
      public function get bufferSize() : int
      {
         return this.var_852;
      }
      
      public function set bufferSize(param1:int) : void
      {
         this.var_852 = param1;
      }
      
      public function get channels() : Vector.<String>
      {
         return this.var_849;
      }
      
      public function set channels(param1:Vector.<String>) : void
      {
         this.var_849 = param1;
      }
      
      public function get chatEnabled() : Boolean
      {
         return this.var_854;
      }
      
      public function set chatEnabled(param1:Boolean) : void
      {
         this.var_854 = param1;
      }
      
      public function get chatModeratorLevel() : ChatModeratorLevel
      {
         return this.var_845;
      }
      
      public function set chatModeratorLevel(param1:ChatModeratorLevel) : void
      {
         this.var_845 = param1;
      }
      
      public function get linksWhiteList() : Vector.<String>
      {
         return this.var_844;
      }
      
      public function set linksWhiteList(param1:Vector.<String>) : void
      {
         this.var_844 = param1;
      }
      
      public function get minChar() : int
      {
         return this.var_846;
      }
      
      public function set minChar(param1:int) : void
      {
         this.var_846 = param1;
      }
      
      public function get minWord() : int
      {
         return this.var_850;
      }
      
      public function set minWord(param1:int) : void
      {
         this.var_850 = param1;
      }
      
      public function get privateMessagesEnabled() : Boolean
      {
         return this.var_848;
      }
      
      public function set privateMessagesEnabled(param1:Boolean) : void
      {
         this.var_848 = param1;
      }
      
      public function get selfName() : String
      {
         return this.var_851;
      }
      
      public function set selfName(param1:String) : void
      {
         this.var_851 = param1;
      }
      
      public function get showLinks() : Boolean
      {
         return this.var_847;
      }
      
      public function set showLinks(param1:Boolean) : void
      {
         this.var_847 = param1;
      }
      
      public function get typingSpeedAntifloodEnabled() : Boolean
      {
         return this.var_857;
      }
      
      public function set typingSpeedAntifloodEnabled(param1:Boolean) : void
      {
         this.var_857 = param1;
      }
      
      public function get symbolCost() : int
      {
         return this.var_856;
      }
      
      public function set symbolCost(param1:int) : void
      {
         this.var_856 = param1;
      }
      
      public function get enterCost() : int
      {
         return this.var_858;
      }
      
      public function set enterCost(param1:int) : void
      {
         this.var_858 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ChatCC [";
         _loc1_ += "admin = " + this.admin + " ";
         _loc1_ += "antifloodEnabled = " + this.antifloodEnabled + " ";
         _loc1_ += "bufferSize = " + this.bufferSize + " ";
         _loc1_ += "channels = " + this.channels + " ";
         _loc1_ += "chatEnabled = " + this.chatEnabled + " ";
         _loc1_ += "chatModeratorLevel = " + this.chatModeratorLevel + " ";
         _loc1_ += "linksWhiteList = " + this.linksWhiteList + " ";
         _loc1_ += "minChar = " + this.minChar + " ";
         _loc1_ += "minWord = " + this.minWord + " ";
         _loc1_ += "privateMessagesEnabled = " + this.privateMessagesEnabled + " ";
         _loc1_ += "selfName = " + this.selfName + " ";
         _loc1_ += "showLinks = " + this.showLinks + " ";
         _loc1_ += "typingSpeedAntifloodEnabled = " + this.typingSpeedAntifloodEnabled + " ";
         _loc1_ += "symbolCost = " + this.symbolCost + " ";
         _loc1_ += "enterCost = " + this.enterCost + " ";
         return _loc1_ + "]";
      }
   }
}
