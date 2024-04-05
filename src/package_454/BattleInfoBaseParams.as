package package_454
{
   import package_13.Long;
   import package_413.name_2283;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class BattleInfoBaseParams
   {
       
      
      public var battle:Object;
      
      public var name_2930:name_2283;
      
      public var name_2929:String;
      
      public var mapName:String;
      
      public var var_211:int;
      
      public var var_3471:Boolean;
      
      public var name_2953:ImageResource;
      
      public var friends:int;
      
      public var var_3470:UserToInfoMap;
      
      public function BattleInfoBaseParams()
      {
         this.var_3470 = new UserToInfoMap();
         super();
      }
      
      public function get battleId() : Long
      {
         return this.battle.id;
      }
   }
}
