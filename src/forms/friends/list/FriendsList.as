package forms.friends.list
{
   import fl.controls.List;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import package_13.Long;
   import package_460.FriendsDataProvider;
   import utils.ScrollStyleUtils;
   
   public class FriendsList extends Sprite
   {
       
      
      protected var _dataProvider:FriendsDataProvider;
      
      protected var var_3000:List;
      
      protected var _width:Number;
      
      protected var _height:Number;
      
      protected var var_3001:Dictionary;
      
      private var de:Long;
      
      public function FriendsList()
      {
         this._dataProvider = new FriendsDataProvider();
         this.var_3000 = new List();
         this.var_3001 = new Dictionary();
         this.de = new Long(0,10000);
         super();
      }
      
      protected function init(param1:Object) : void
      {
         this.var_3000.rowHeight = 20;
         this.var_3000.setStyle("cellRenderer",param1);
         this.var_3000.focusEnabled = true;
         this.var_3000.selectable = false;
         ScrollStyleUtils.setGreenStyle(this.var_3000);
         this.var_3000.dataProvider = this._dataProvider;
         addChild(this.var_3000);
         ScrollStyleUtils.setGreenStyle(this.var_3000);
      }
      
      protected function method_1161(param1:Object) : Boolean
      {
         return param1 in this.var_3001;
      }
      
      protected function method_1462(param1:Object) : void
      {
         this.var_3001[param1] = true;
      }
      
      protected function method_2796(param1:String) : void
      {
         var _loc3_:Object = null;
         var _loc2_:int = 0;
         for each(_loc3_ in JSON.parse(param1).friends)
         {
            if(_loc3_ == null)
            {
               return;
            }
            this._dataProvider.addUser(_loc3_.id,_loc3_.battleId,_loc3_.battleName,_loc2_,_loc3_.rank,_loc3_.online);
            _loc2_++;
         }
         if(_loc3_ == null)
         {
            return;
         }
         this._dataProvider.name_3014(new Long(0,_loc3_.id),_loc3_.online);
         this._dataProvider.refresh();
      }
      
      protected function method_2797(param1:String) : void
      {
         var _loc3_:Object = null;
         var _loc2_:int = 0;
         for each(_loc3_ in JSON.parse(param1).incoming)
         {
            if(_loc3_ == null)
            {
               return;
            }
            this._dataProvider.addUser(_loc3_.id,"","",_loc2_,_loc3_.rank,true);
            _loc2_++;
         }
         if(_loc3_ == null)
         {
            return;
         }
         this._dataProvider.name_3014(new Long(0,_loc3_.id),true);
         this._dataProvider.refresh();
      }
      
      protected function method_2799(param1:String) : void
      {
         var _loc3_:Object = null;
         var _loc2_:int = 0;
         for each(_loc3_ in JSON.parse(param1).outcoming)
         {
            if(_loc3_ == null)
            {
               return;
            }
            this._dataProvider.addUser(_loc3_.id,"","",_loc2_,_loc3_.rank,true);
            _loc2_++;
         }
         if(_loc3_ == null)
         {
            return;
         }
         this._dataProvider.name_3014(new Long(0,_loc3_.id),true);
         this._dataProvider.refresh();
      }
      
      public function method_2798(param1:String, param2:int, param3:int, param4:Boolean) : void
      {
         this._dataProvider.addUser(param1,"","",param2,param3,param4);
         this._dataProvider.name_3014(new Long(0,param2),param4);
         this._dataProvider.refresh();
      }
      
      protected function method_1464(param1:String, param2:String) : void
      {
         this._dataProvider.method_1422(param1,param2);
         this.resize(this._width,this._height);
      }
      
      public function resize(param1:Number, param2:Number) : void
      {
         this._width = param1;
         this._height = param2;
         var _loc3_:Boolean = this.var_3000.verticalScrollBar.visible;
         this.var_3000.width = _loc3_ ? Number(Number(this._width + 6)) : Number(Number(this._width));
         this.var_3000.height = this._height;
      }
   }
}
