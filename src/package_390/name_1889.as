package package_390
{
   import alternativa.tanks.model.friends.FriendsService;
   import base.class_122;
   import controls.base.LabelBase;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.system.System;
   import forms.name_1139;
   import package_1.Main;
   import package_12.name_24;
   import package_120.name_408;
   import package_25.name_353;
   import package_25.name_52;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_346.UserInfoUpdateEvent;
   import package_347.name_1666;
   import package_439.FriendInfoLabelUpdaterEvent;
   import package_90.name_308;
   
   public class name_1889 extends Sprite
   {
      
      public static var userInfoService:name_408 = Main.osgi.getService(name_408) as name_408;
      
      public static var clanUserInfoService:name_52 = Main.osgi.getService(name_52) as name_52;
      
      public static var contextMenuService:name_308 = Main.osgi.getService(name_308) as name_308;
      
      public static var display:DisplayObjectContainer = (Main.osgi.getService(name_24) as name_24).dialogsLayer as DisplayObjectContainer;
      
      protected static const const_2059:int = 20;
      
      private static const const_2060:int = 18;
       
      
      protected var var_2577:class_122;
      
      protected var var_913:String;
      
      protected var var_1557:String;
      
      protected var var_1550:int;
      
      protected var var_2579:name_1666;
      
      protected var var_1554:LabelBase;
      
      protected var var_2590:Boolean;
      
      protected var var_2589:Boolean;
      
      protected var var_2591:Boolean;
      
      protected var var_2581:Boolean;
      
      protected var var_2583:Boolean;
      
      protected var var_2588:Boolean;
      
      protected var var_2578:Boolean;
      
      private var var_2580:Boolean;
      
      private var var_1561:SmallRankIcon;
      
      private var var_2586:Boolean;
      
      private var var_958:int;
      
      private var _self:Boolean;
      
      private var var_2582:uint;
      
      private var var_2587:Boolean;
      
      private var var_2584:String = "";
      
      protected var var_2585:Boolean = true;
      
      private var var_2593:Boolean = true;
      
      private var var_2592:Boolean = true;
      
      public function name_1889(param1:String, param2:Boolean = true)
      {
         this.var_2577 = new class_122();
         super();
         if(param1 == null)
         {
            throw Error("UserLabel userId is NULL");
         }
         this.var_913 = param1;
         this.var_2585 = param2;
         this.init();
      }
      
      protected function method_2565() : Array
      {
         return null;
      }
      
      private function init() : void
      {
         mouseChildren = false;
         mouseEnabled = true;
         tabEnabled = false;
         tabChildren = false;
         addChild(this.var_2577);
         this.var_2577.filters = this.method_2565();
         this.var_2582 = name_1139.name_1894;
         this._self = PanelModel(Main.osgi.getService(name_115)).userName == this.var_913;
         if(!this._self)
         {
            useHandCursor = true;
            buttonMode = true;
         }
         this.method_2562();
         this.method_2563();
         this.method_2566();
         this.method_2561();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      protected function method_2563() : void
      {
      }
      
      protected function method_2561() : void
      {
         if(userInfoService.hasData(this.var_913))
         {
            this.name_122(userInfoService.getData(this.var_913).rank);
            this.method_2554(userInfoService.getData(this.var_913).nickname);
            this.method_2557(userInfoService.getData(this.var_913).online);
         }
         this.method_2558(FriendsService.method_1174(this.var_913));
      }
      
      protected function method_2568() : Number
      {
         return 0;
      }
      
      protected function method_2566() : void
      {
         this.var_1554 = new LabelBase();
         this.var_1554.x = 20 - 2 + this.method_2568();
         this.var_2577.addChild(this.var_1554);
         this.var_1554.visible = false;
      }
      
      private function method_2562() : void
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.clear();
         _loc1_.graphics.beginFill(65535,0);
         _loc1_.graphics.drawRect(0,0,20,18);
         _loc1_.graphics.endFill();
         this.var_1561 = new SmallRankIcon();
         _loc1_.addChild(this.var_1561);
         this.var_2577.addChild(_loc1_);
         this.var_1561.visible = false;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         this.method_1579();
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.method_2567();
      }
      
      private function method_1579() : void
      {
         if(!this.hasEventListener(MouseEvent.CLICK))
         {
            this.addEventListener(MouseEvent.CLICK,this.method_2555);
         }
         FriendsService.method_1179().addEventListener(FriendInfoLabelUpdaterEvent.CHANGE_STATE,this.method_2556,false,0,true);
         userInfoService.addEventListener(UserInfoUpdateEvent.INFO_UPDATED,this.method_2560,false,0,true);
      }
      
      private function method_2567() : void
      {
         if(this.hasEventListener(MouseEvent.CLICK))
         {
            this.removeEventListener(MouseEvent.CLICK,this.method_2555);
         }
         FriendsService.method_1179().removeEventListener(FriendInfoLabelUpdaterEvent.CHANGE_STATE,this.method_2556);
         userInfoService.removeEventListener(UserInfoUpdateEvent.INFO_UPDATED,this.method_2560);
      }
      
      protected function method_2555(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         if(PanelModel(Main.osgi.getService(name_115)).userName == this.var_913)
         {
            return;
         }
         if(!this.var_2581 || !this.var_2583)
         {
            return;
         }
         if(param1.ctrlKey)
         {
            System.setClipboard(this.var_1557);
         }
         else
         {
            switch(this.var_2579)
            {
               case name_1666.name_1669:
                  _loc3_ = true;
                  break;
               case name_1666.INCOMING:
                  _loc4_ = true;
                  _loc5_ = true;
                  break;
               case name_1666.OUTGOING:
                  _loc6_ = true;
                  break;
               default:
                  _loc2_ = true;
            }
            contextMenuService.show(display.stage.mouseX,display.stage.mouseY,this.var_913,this.var_1550,this.var_1557,_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,this.var_2590,this.var_2580,this.var_2588,this.var_2589);
         }
      }
      
      private function method_2557(param1:Boolean) : void
      {
         this.var_2586 = param1;
         this.var_958 = 1;
      }
      
      protected function method_2554(param1:String) : void
      {
         if(!this.var_2583)
         {
            this.var_2583 = true;
            this.var_1554.visible = true;
         }
         this.var_1557 = param1;
         var _loc2_:String = this.method_2569(this.var_1557);
         var _loc3_:String = _loc2_ + this.var_2584;
         if(this.var_1554.text == _loc3_)
         {
            return;
         }
         this.var_1554.text = _loc3_;
         dispatchEvent(new ChatUpdateEvent(ChatUpdateEvent.UPDATE,true));
      }
      
      public function method_2569(param1:String) : String
      {
         var _loc2_:name_353 = clanUserInfoService.method_373(this.userId);
         var _loc3_:String = "";
         if(this.var_2585 && _loc2_ != null && _loc2_.name_870)
         {
            _loc3_ = "[" + _loc2_.clanTag + "] ";
         }
         return _loc3_ + param1;
      }
      
      public function method_2570(param1:String) : void
      {
         this.var_2584 = param1;
         this.method_2554(this.var_1557);
      }
      
      protected function name_122(param1:int) : void
      {
         this.var_1550 = param1;
         this.method_2564();
         if(!this.var_2581)
         {
            this.var_2581 = true;
            this.var_1561.init(this.var_2578,this.var_1550);
            this.var_1561.visible = true;
         }
         else if(this.var_2578)
         {
            this.var_1561.name_971(this.var_1550);
         }
         else
         {
            this.var_1561.name_122(this.var_1550);
         }
         this.method_1943();
      }
      
      protected function method_2564() : void
      {
         if(userInfoService.hasData(this.var_913))
         {
            this.var_2578 = userInfoService.getData(this.var_913).premium;
         }
      }
      
      private function method_1943() : void
      {
         this.var_1561.x = 20 - this.var_1561.width >> 1;
         this.var_1561.y = 18 - this.var_1561.height >> 1;
      }
      
      private function method_2556(param1:FriendInfoLabelUpdaterEvent) : void
      {
         this.method_2558(FriendsService.method_1174(this.var_913));
      }
      
      private function method_2560(param1:UserInfoUpdateEvent) : void
      {
         if(param1.userId == this.var_913)
         {
            this.name_122(param1.rank);
            this.method_2554(param1.userId);
            this.method_2557(param1.online);
         }
      }
      
      protected function method_2558(param1:name_1666) : void
      {
         this.var_2579 = param1;
         this.method_2559();
      }
      
      protected function method_2559() : void
      {
         if(!this.var_2587)
         {
            if(this.var_2579 == name_1666.name_1669)
            {
               this.var_1554.color = name_1139.name_2150;
               return;
            }
            this.var_1554.color = this.var_2582;
         }
      }
      
      public function name_2046(param1:uint, param2:Boolean = false) : void
      {
         this.var_2582 = param1;
         this.var_2587 = param2;
         this.var_1554.color = param1;
         this.method_2559();
      }
      
      public function get online() : Boolean
      {
         return this.var_2586;
      }
      
      public function get serverNumber() : int
      {
         return this.var_958;
      }
      
      public function get userRank() : int
      {
         return this.var_1550;
      }
      
      public function get self() : Boolean
      {
         return this._self;
      }
      
      public function get uid() : String
      {
         return this.var_1557;
      }
      
      public function get userId() : String
      {
         return this.var_913;
      }
      
      public function get inviteBattleEnable() : Boolean
      {
         return this.var_2580;
      }
      
      public function set inviteBattleEnable(param1:Boolean) : void
      {
         this.var_2580 = param1;
      }
      
      public function get premium() : Boolean
      {
         return this.var_2578;
      }
      
      public function set premium(param1:Boolean) : void
      {
         this.var_2578 = param1;
         this.method_2561();
      }
   }
}
