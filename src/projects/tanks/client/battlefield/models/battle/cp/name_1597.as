package projects.tanks.client.battlefield.models.battle.cp
{
   import package_312.name_1311;
   import package_312.name_1607;
   
   public class name_1597
   {
       
      
      private var var_2395:Number;
      
      private var var_2394:Number;
      
      private var var_2396:Number;
      
      private var _resources:name_1311;
      
      private var var_2129:name_1607;
      
      public function name_1597(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:name_1311 = null, param5:name_1607 = null)
      {
         super();
         this.var_2395 = param1;
         this.var_2394 = param2;
         this.var_2396 = param3;
         this._resources = param4;
         this.var_2129 = param5;
      }
      
      public function get keypointTriggerRadius() : Number
      {
         return this.var_2395;
      }
      
      public function set keypointTriggerRadius(param1:Number) : void
      {
         this.var_2395 = param1;
      }
      
      public function get keypointVisorHeight() : Number
      {
         return this.var_2394;
      }
      
      public function set keypointVisorHeight(param1:Number) : void
      {
         this.var_2394 = param1;
      }
      
      public function get minesRestrictionRadius() : Number
      {
         return this.var_2396;
      }
      
      public function set minesRestrictionRadius(param1:Number) : void
      {
         this.var_2396 = param1;
      }
      
      public function get resources() : name_1311
      {
         return this._resources;
      }
      
      public function set resources(param1:name_1311) : void
      {
         this._resources = param1;
      }
      
      public function get sounds() : name_1607
      {
         return this.var_2129;
      }
      
      public function set sounds(param1:name_1607) : void
      {
         this.var_2129 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ControlPointsCC [";
         _loc1_ += "keypointTriggerRadius = " + this.keypointTriggerRadius + " ";
         _loc1_ += "keypointVisorHeight = " + this.keypointVisorHeight + " ";
         _loc1_ += "minesRestrictionRadius = " + this.minesRestrictionRadius + " ";
         _loc1_ += "resources = " + this.resources + " ";
         _loc1_ += "sounds = " + this.sounds + " ";
         return _loc1_ + "]";
      }
   }
}
