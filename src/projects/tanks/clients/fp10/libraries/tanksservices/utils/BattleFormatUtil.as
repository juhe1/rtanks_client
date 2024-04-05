package projects.tanks.clients.fp10.libraries.tanksservices.utils
{
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_116.name_340;
   import package_116.name_365;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class BattleFormatUtil
   {
      
      public static var localeService:name_102 = Main.osgi.name_6(name_102) as name_102;
       
      
      private var var_1529:Dictionary;
      
      private var var_1530:Vector.<name_340>;
      
      public function BattleFormatUtil()
      {
         super();
      }
      
      public function init(param1:name_365) : void
      {
         var modeInfo:name_340 = null;
         var equipmentConstraintsCC:name_365 = param1;
         if(this.var_1529 != null)
         {
            return;
         }
         this.var_1530 = equipmentConstraintsCC.equipmentConstraintsModeInfos.concat().sort(function(param1:name_340, param2:name_340):int
         {
            return param1.index - param2.index;
         });
         this.var_1529 = new Dictionary();
         for each(modeInfo in this.var_1530)
         {
            this.var_1529[modeInfo.mode] = modeInfo.name;
         }
      }
      
      public function method_1738(param1:String, param2:Boolean) : Boolean
      {
         return param2 || param1 != null;
      }
      
      public function method_1737(param1:String, param2:Boolean) : String
      {
         if(param2)
         {
            return this.method_1736();
         }
         return param1 != null ? String(this.var_1529[param1]) : "";
      }
      
      public function method_1736() : String
      {
         return localeService.getText(name_390.const_1042);
      }
      
      public function method_1739() : Vector.<name_340>
      {
         return this.var_1530;
      }
      
      public function method_1740() : String
      {
         return "Клановый";
      }
   }
}
