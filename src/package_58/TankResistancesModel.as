package package_58
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.weapon.IWeaponController;
   import flash.utils.Dictionary;
   import package_41.ItemProperty;
   import package_51.TankResistancesModelBase;
   import package_51.name_309;
   import package_51.name_90;
   import package_56.name_95;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.type.name_70;
   
   public class TankResistancesModel extends TankResistancesModelBase implements name_309, name_112, name_141
   {
      
      public static var var_35:name_95 = OSGi.getInstance().getService(name_95) as name_95;
      
      public static var var_13:TankModel = OSGi.getInstance().getService(ITank) as TankModel;
       
      
      public function TankResistancesModel()
      {
         super();
      }
      
      public function objectLoadedPost() : void
      {
         var _loc1_:name_70 = null;
         if(Boolean(var_35.method_572()) && var_35.method_574() == object)
         {
            for each(_loc1_ in var_35.method_573())
            {
               if(_loc1_ != object)
               {
                  this.setResistance(_loc1_,true);
               }
            }
         }
         else
         {
            this.setResistance(object,true);
         }
      }
      
      public function getResistance(param1:Boolean) : int
      {
         if(!var_35.method_572() || var_35.method_574() == object)
         {
            return 0;
         }
         var _loc2_:name_70 = var_35.method_574();
         var _loc3_:ITank = ITank(_loc2_.name_176(ITank));
         var _loc4_:Dictionary = Dictionary(getData(Dictionary));
         if(_loc4_ == null || param1)
         {
            _loc4_ = this.method_984();
            putData(Dictionary,_loc4_);
         }
         if(ItemProperty.ALL_RESISTANCE in _loc4_)
         {
            return _loc4_[ItemProperty.ALL_RESISTANCE];
         }
         var _loc5_:IWeaponController = _loc3_.getTank().tankData.weapon.getWeaponController();
         var _loc6_:ItemProperty = _loc5_.name_1436();
         if(_loc6_ in _loc4_)
         {
            return _loc4_[_loc6_];
         }
         return 0;
      }
      
      public function method_501() : Vector.<name_90>
      {
         if(method_771() == null)
         {
            return null;
         }
         return method_771().resistances;
      }
      
      private function method_984() : Dictionary
      {
         var _loc1_:name_90 = null;
         var _loc2_:Dictionary = new Dictionary();
         for each(_loc1_ in method_771().resistances)
         {
            _loc2_[_loc1_.resistanceProperty] = _loc1_.resistanceInPercent;
         }
         return _loc2_;
      }
      
      private function setResistance(param1:name_70, param2:Boolean) : void
      {
         var _loc3_:int = int(name_112(param1.name_176(name_112)).getResistance(param2));
         ITank(param1.name_176(ITank)).getTank().title.setResistance(_loc3_);
      }
      
      public function updateOthersResistances() : void
      {
         var _loc1_:name_70 = null;
         for each(_loc1_ in var_35.method_573())
         {
            if(_loc1_ != object)
            {
               this.setResistance(_loc1_,true);
            }
         }
      }
   }
}
