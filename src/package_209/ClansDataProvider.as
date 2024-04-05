package package_209
{
   import alternativa.tanks.models.user.name_65;
   import fl.data.DataProvider;
   import flash.utils.Dictionary;
   import package_13.Long;
   import package_190.name_571;
   import package_26.ClanUserNotificationsManager;
   import platform.client.fp10.core.type.name_70;
   
   public class ClansDataProvider extends DataProvider
   {
      
      private static var var_1163:RegExp = /\-|\./;
      
      private static var var_1164:RegExp = /\*/g;
      
      public static var clanUserService:name_65;
       
      
      private var var_1168:Function;
      
      private var var_1160:Dictionary;
      
      private var var_1161:String = "";
      
      private var var_1162:Object;
      
      private var var_1165:Object = null;
      
      private var var_1166:String;
      
      private var var_1167:RegExp;
      
      public function ClansDataProvider()
      {
         this.var_1160 = new Dictionary();
         this.var_1162 = ["id"];
         super();
      }
      
      private static function method_1417(param1:String) : RegExp
      {
         param1 = param1.replace(var_1163,"\\$&").replace(var_1164,".*");
         param1 = "^" + param1;
         return new RegExp(param1,"i");
      }
      
      public function method_1423(param1:Long, param2:String, param3:Boolean = true) : Object
      {
         var _loc4_:Object = {};
         _loc4_.id = param1;
         _loc4_.type = param2;
         _loc4_.name = this.getClanName(param1);
         _loc4_.isNew = ClanUserNotificationsManager.name_1873(param1);
         this.var_1160[param1] = _loc4_;
         super.addItem(this.var_1160[param1]);
         if(param3)
         {
            this.refresh();
         }
         return this.var_1160[param1];
      }
      
      private function getClanName(param1:Long) : String
      {
         var _loc2_:name_70 = clanUserService.method_355(param1);
         var _loc3_:name_571 = _loc2_.name_176(name_571) as name_571;
         return _loc3_.getClanName();
      }
      
      public function get getItemAtHandler() : Function
      {
         return this.var_1168;
      }
      
      public function set getItemAtHandler(param1:Function) : void
      {
         this.var_1168 = param1;
      }
      
      override public function getItemAt(param1:uint) : Object
      {
         var _loc2_:Object = super.getItemAt(param1);
         if(this.getItemAtHandler != null)
         {
            this.getItemAtHandler(_loc2_);
         }
         return _loc2_;
      }
      
      public function method_1421(param1:Long) : void
      {
         if(param1 in this.var_1160)
         {
            super.removeItem(this.var_1160[param1]);
            delete this.var_1160[param1];
         }
      }
      
      public function method_1420(param1:Boolean = true) : void
      {
         var _loc2_:Object = null;
         this.var_1161 = "";
         if(!param1)
         {
            return;
         }
         super.removeAll();
         for each(_loc2_ in this.var_1160)
         {
            super.addItem(_loc2_);
         }
         this.method_1418();
      }
      
      override public function sortOn(param1:Object, param2:Object = null) : *
      {
         this.var_1162 = param1;
         this.var_1165 = param2;
         super.sortOn(this.var_1162,this.var_1165);
      }
      
      public function method_1418() : void
      {
         super.sortOn(this.var_1162,this.var_1165);
      }
      
      public function filter() : void
      {
         var _loc1_:Object = null;
         if(this.var_1161 != "")
         {
            super.removeAll();
            for each(_loc1_ in this.var_1160)
            {
               if(this.method_1419(_loc1_))
               {
                  super.addItem(_loc1_);
               }
            }
         }
         this.method_1418();
      }
      
      public function method_1422(param1:String, param2:String) : void
      {
         if(param2 == "" && this.var_1161 != "")
         {
            this.method_1420();
            return;
         }
         this.var_1166 = param1;
         this.var_1161 = param2;
         this.var_1167 = method_1417(this.var_1161);
         this.filter();
      }
      
      private function method_1419(param1:Object) : Boolean
      {
         return param1.hasOwnProperty(this.var_1166) && param1[this.var_1166].search(this.var_1167) != -1;
      }
      
      public function refresh() : void
      {
         this.filter();
      }
   }
}
