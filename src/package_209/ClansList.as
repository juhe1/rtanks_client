package package_209
{
   import alternativa.tanks.models.user.name_65;
   import fl.controls.List;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import forms.name_1919;
   import package_13.Long;
   import package_26.ClanUserNotificationsManager;
   import utils.ScrollStyleUtils;
   
   public class ClansList extends Sprite
   {
      
      public static var clanUserService:name_65;
       
      
      protected var dataProvider:ClansDataProvider;
      
      protected var list:List;
      
      protected var var_1221:Dictionary;
      
      protected var _width:Number;
      
      protected var _height:Number;
      
      private var header:ClansListHeader;
      
      public function ClansList()
      {
         super();
         this.var_1221 = new Dictionary();
         this.header = new ClansListHeader();
         addChild(this.header);
         this.list = new List();
         this.list.y = 20;
         this.list.rowHeight = 20;
         this.list.setStyle(name_1919.name_1920,ClansListRenderer);
         this.list.focusEnabled = true;
         this.list.selectable = false;
         ScrollStyleUtils.setGreenStyle(this.list);
         this.dataProvider = new ClansDataProvider();
         this.dataProvider.getItemAtHandler = this.method_1461;
         this.dataProvider.sortOn(["isNew","name"],[Array.NUMERIC | Array.DESCENDING,Array.CASEINSENSITIVE]);
         this.list.dataProvider = this.dataProvider;
         addChild(this.list);
         ScrollStyleUtils.setGreenStyle(this.list);
      }
      
      private function method_1461(param1:Object) : void
      {
         if(!this.method_1161(param1))
         {
            if(param1.type == name_1916.INCOMING)
            {
               ClanUserNotificationsManager.name_1917(param1.id);
            }
            this.method_1462(param1);
         }
      }
      
      public function method_1465() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in this.var_1221)
         {
            ClanUserNotificationsManager.name_1917(_loc1_.id);
         }
      }
      
      public function method_1423(param1:Long, param2:String) : void
      {
         this.dataProvider.method_1423(param1,param2);
         this.resize(this._width,this._height);
      }
      
      public function method_1421(param1:Long) : void
      {
         this.dataProvider.method_1421(param1);
         this.dataProvider.refresh();
         this.resize(this._width,this._height);
      }
      
      protected function method_1161(param1:Object) : Boolean
      {
         return param1 in this.var_1221;
      }
      
      protected function method_1462(param1:Object) : void
      {
         this.var_1221[param1] = true;
      }
      
      public function refresh() : void
      {
         this.dataProvider.refresh();
      }
      
      public function method_1463(param1:Vector.<Long>, param2:String) : void
      {
         var _loc3_:Long = null;
         this.dataProvider.removeAll();
         this.dataProvider.method_1420(false);
         for each(_loc3_ in param1)
         {
            this.dataProvider.method_1423(_loc3_,param2,false);
         }
         this.dataProvider.refresh();
         this.resize(this._width,this._height);
      }
      
      public function method_1464(param1:String, param2:String) : void
      {
         this.dataProvider.method_1422(param1,param2);
         this.resize(this._width,this._height);
      }
      
      public function resize(param1:Number, param2:Number) : void
      {
         this._width = param1;
         this._height = param2;
         this.header.width = param1;
         this.list.height = this._height - 20;
         var _loc3_:Boolean = this.list.verticalScrollBar.visible;
         this.list.width = _loc3_ ? Number(this._width + 6) : Number(this._width);
      }
   }
}
