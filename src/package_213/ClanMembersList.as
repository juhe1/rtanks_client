package package_213
{
   import base.class_122;
   import fl.controls.List;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import forms.name_1919;
   import package_13.Long;
   import package_215.ClanMembersDataProvider;
   import package_29.name_64;
   import utils.name_1915;
   
   public class ClanMembersList extends class_122
   {
      
      public static var clanMembersData:name_64;
       
      
      private var dataProvider:ClanMembersDataProvider;
      
      private var list:List;
      
      protected var var_1221:Dictionary;
      
      private var _width:int;
      
      private var _height:int;
      
      private var header:HeaderClanMemberList;
      
      public function ClanMembersList()
      {
         this.dataProvider = new ClanMembersDataProvider();
         this.list = new List();
         this.var_1221 = new Dictionary();
         this.header = new HeaderClanMemberList();
         super();
         addChild(this.header);
         this.list.y = 20;
         this.list.rowHeight = 20;
         this.list.setStyle(name_1919.name_1920,name_2032);
         this.list.focusEnabled = true;
         this.list.selectable = false;
         name_1915.name_1918(this.list);
         this.dataProvider.getItemAtHandler = this.method_1461;
         this.list.dataProvider = this.dataProvider;
         addChild(this.list);
         name_1915.name_1918(this.list);
         addEventListener(Event.ADDED_TO_STAGE,this.method_1436);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      private function method_1461(param1:Object) : void
      {
         if(!this.method_1161(param1))
         {
            this.method_1462(param1);
         }
      }
      
      protected function method_1462(param1:Object) : void
      {
         this.var_1221[param1] = true;
      }
      
      protected function method_1161(param1:Object) : Boolean
      {
         return param1 in this.var_1221;
      }
      
      public function method_1479(param1:Vector.<Object>) : void
      {
         var _loc2_:Object = null;
         this.dataProvider.removeAll();
         for each(_loc2_ in param1)
         {
            this.dataProvider.addItem(_loc2_);
         }
         this.update();
      }
      
      private function sort() : void
      {
         this.dataProvider.sortOn(["permissionIndex","date"],[Array.NUMERIC,Array.NUMERIC | Array.DESCENDING]);
      }
      
      public function removeUser(param1:Long) : void
      {
         var _loc2_:int = this.dataProvider.name_1938(param1);
         if(_loc2_ >= 0)
         {
            this.dataProvider.removeItemAt(_loc2_);
         }
         this.update();
      }
      
      public function addUser(param1:Object) : void
      {
         this.dataProvider.addItem(param1);
         this.update(param1);
      }
      
      private function update(param1:Object = null) : void
      {
         if(param1 != null)
         {
            this.method_1461(param1);
         }
         this.sort();
         this.onResize();
      }
      
      private function method_1436(param1:Event) : void
      {
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize();
      }
      
      private function onResize(param1:Event = null) : void
      {
         var _loc2_:Boolean = false;
         this.list.height = this._height - 20;
         _loc2_ = this.list.maxVerticalScrollPosition > 0;
         this.header.width = this._width;
         this.list.width = _loc2_ ? Number(this._width + 8) : Number(this._width);
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         var _loc2_:Object = null;
         stage.removeEventListener(Event.RESIZE,this.onResize);
         var _loc3_:int = 0;
         while(_loc3_ < this.dataProvider.length)
         {
            _loc2_ = this.dataProvider.getItemAt(_loc3_);
            _loc2_.isNew = false;
            _loc3_++;
         }
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this.onResize();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = param1;
         this.onResize();
      }
   }
}
