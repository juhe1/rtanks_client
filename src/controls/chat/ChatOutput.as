package controls.chat
{
   import alternativa.tanks.gui.chat.ChangeChatChannelEvent;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Sprite;
   import flash.utils.setTimeout;
   import package_390.ChatUpdateEvent;
   import package_423.ChatAddressMode;
   import package_423.MessageType;
   
   public class ChatOutput extends ScrollPane
   {
       
      
      private const var_1412:int = 80;
      
      private var var_3131:Sprite;
      
      private var var_3134:Number;
      
      public var name_2516:Boolean = true;
      
      public var name_2519:int = 9;
      
      public var selfName:String;
      
      private var var_3133:name_2520;
      
      private var var_3136:Boolean;
      
      private var privateMessagesEnabled:Boolean;
      
      private var var_3135:uint = 0;
      
      private var var_2198:String;
      
      private var var_3132:HiddenMessageKeeper;
      
      public function ChatOutput()
      {
         this.var_3131 = new Sprite();
         super();
         this.source = this.var_3131;
         this.var_3132 = new HiddenMessageKeeper();
         this.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.focusEnabled = false;
         this.var_3131.addEventListener(ChatUpdateEvent.UPDATE,this.method_2834);
      }
      
      public function addMessage(param1:name_2508, param2:name_2508, param3:ChatAddressMode, param4:String, param5:String, param6:MessageType = null, param7:Boolean = false) : void
      {
         var _loc8_:name_3079 = new name_3079(param1,param2,param3,param5,param6,param7);
         if(param4 == this.var_2198)
         {
            this.method_223(_loc8_);
         }
         else
         {
            this.var_3132.method_2285(param4,_loc8_);
         }
      }
      
      public function method_223(param1:name_3079, param2:Boolean = true) : void
      {
         var _loc3_:Boolean = false;
         _loc3_ = false;
         var _loc4_:name_2520 = null;
         if(param2)
         {
            _loc3_ = this.verticalScrollPosition + 5 > this.maxVerticalScrollPosition || this.name_2516;
         }
         if(this.var_3131.numChildren > 80)
         {
            this.name_1352();
            this.var_3133 = null;
            _loc4_ = new name_2520(param1,this.var_3134,this.privateMessagesEnabled,this.var_3136);
         }
         else
         {
            _loc4_ = new name_2520(param1,this.var_3134,this.privateMessagesEnabled,this.var_3136);
         }
         _loc4_.method_2892 = false;
         var _loc5_:int = int(this.var_3131.height + 0.5);
         _loc4_.self = _loc4_.method_2893 == this.selfName;
         _loc4_.y = _loc5_;
         this.var_3131.addChild(_loc4_);
         this.update();
         if(_loc3_)
         {
            this.verticalScrollPosition = this.maxVerticalScrollPosition;
         }
      }
      
      public function name_2522() : void
      {
         this.verticalScrollPosition = this.maxVerticalScrollPosition;
      }
      
      public function name_2510(param1:String) : void
      {
         var _loc2_:name_2520 = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_3131.numChildren)
         {
            _loc2_ = this.var_3131.getChildAt(_loc3_) as name_2520;
            _loc2_.light = _loc2_.userName == param1 && param1 != "";
            _loc2_.self = _loc2_.method_2893 == this.selfName && param1 != "";
            _loc3_++;
         }
      }
      
      private function name_1352() : void
      {
         this.var_3133 = this.var_3131.getChildAt(0) as name_2520;
         var _loc1_:Number = this.var_3133.height + this.var_3133.y;
         this.var_3131.removeChild(this.var_3133);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_3131.numChildren)
         {
            this.var_3131.getChildAt(_loc2_).y = this.var_3131.getChildAt(_loc2_).y - _loc1_;
            _loc2_++;
         }
      }
      
      override public function setSize(param1:Number, param2:Number) : void
      {
         super.setSize(param1,param2);
         this.var_3134 = param1 - this.name_2519;
         this.method_2903();
      }
      
      private function method_2834(param1:ChatUpdateEvent) : void
      {
         if(this.var_3135 == 0)
         {
            this.var_3135 = setTimeout(this.method_2904,500);
         }
      }
      
      private function method_2904() : void
      {
         var _loc1_:name_2520 = null;
         var _loc2_:name_2520 = null;
         this.var_3135 = 0;
         if(this.var_3131.numChildren == 0)
         {
            return;
         }
         var _loc3_:Vector.<name_2520> = new Vector.<name_2520>();
         while(this.var_3131.numChildren > 0)
         {
            _loc2_ = this.var_3131.getChildAt(0) as name_2520;
            _loc2_.method_2892 = this.var_3136;
            _loc2_.width = this.var_3134;
            _loc3_.push(_loc2_);
            this.var_3131.removeChildAt(0);
         }
         for each(_loc1_ in _loc3_)
         {
            _loc1_.y = int(this.var_3131.height + 0.5);
            this.var_3131.addChild(_loc1_);
         }
         update();
      }
      
      private function method_2903() : void
      {
         var _loc1_:name_2520 = null;
         var _loc5_:int = 0;
         var _loc2_:Array = new Array();
         var _loc3_:int = 0;
         var _loc4_:Boolean = this.var_3131.numChildren > 0;
         while(this.var_3131.numChildren > 0)
         {
            _loc1_ = this.var_3131.getChildAt(_loc5_) as name_2520;
            _loc1_.width = this.var_3134;
            _loc2_.push(_loc1_);
            this.var_3131.removeChildAt(0);
         }
         _loc5_ = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc1_ = _loc2_[_loc5_];
            _loc3_ = int(this.var_3131.height + 0.5);
            _loc1_.y = _loc3_;
            this.var_3131.addChild(_loc1_);
            _loc5_++;
         }
         if(_loc4_)
         {
            this.update();
         }
      }
      
      public function method_2260(param1:String, param2:String) : void
      {
         var _loc5_:name_2520 = null;
         var _loc3_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < this.var_3131.numChildren)
         {
            _loc5_ = this.var_3131.getChildAt(_loc4_) as name_2520;
            if(_loc5_.userName == param1 || param1 == "")
            {
               _loc3_.push(_loc5_);
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            this.var_3131.removeChild(_loc3_[_loc4_]);
            _loc4_++;
         }
         this.method_2903();
         this.update();
         this.var_3132.method_2260(param1);
         if(param2 != null)
         {
            this.var_3132.name_3095(param2);
         }
      }
      
      public function method_2255(param1:String) : void
      {
         var _loc4_:name_2520 = null;
         var _loc2_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < this.var_3131.numChildren)
         {
            _loc4_ = this.var_3131.getChildAt(_loc3_) as name_2520;
            if(_loc4_.var_3114.text == param1)
            {
               _loc2_.push(_loc4_);
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            this.var_3131.removeChild(_loc2_[_loc3_]);
            _loc3_++;
         }
         this.method_2903();
         this.update();
      }
      
      public function name_2518(param1:Boolean, param2:String) : void
      {
         var _loc3_:Vector.<name_2520> = null;
         var _loc4_:int = 0;
         var _loc5_:Vector.<name_3079> = null;
         var _loc6_:name_2520 = null;
         var _loc7_:name_3079 = null;
         if(param2 != this.var_2198)
         {
            _loc3_ = new Vector.<name_2520>();
            _loc4_ = 0;
            while(_loc4_ < this.var_3131.numChildren)
            {
               _loc6_ = this.var_3131.getChildAt(_loc4_) as name_2520;
               _loc7_ = _loc6_.getData();
               this.var_3132.method_2285(this.var_2198,_loc7_);
               _loc3_.push(_loc6_);
               _loc4_++;
            }
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               this.var_3131.removeChild(_loc3_[_loc4_]);
               _loc4_++;
            }
            this.method_2904();
            this.var_2198 = param2;
            dispatchEvent(new ChangeChatChannelEvent(this.var_2198));
            _loc5_ = this.var_3132.name_3095(param2);
            _loc4_ = 0;
            while(_loc4_ < _loc5_.length)
            {
               _loc7_ = _loc5_[_loc4_];
               this.method_223(_loc7_,param1);
               _loc4_++;
            }
            update();
         }
      }
   }
}
