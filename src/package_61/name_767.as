package package_61
{
   public class name_767
   {
       
      
      public var name_714:Number = 1e+308;
      
      public var name_699:Number = 1e+308;
      
      public var minZ:Number = 1e+308;
      
      public var name_738:Number = -1e+308;
      
      public var name_739:Number = -1e+308;
      
      public var name_760:Number = -1e+308;
      
      public function name_767()
      {
         super();
      }
      
      public function setSize(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.name_714 = param1;
         this.name_699 = param2;
         this.minZ = param3;
         this.name_738 = param4;
         this.name_739 = param5;
         this.name_760 = param6;
      }
      
      public function name_902(param1:name_767) : void
      {
         this.name_714 = param1.name_714 < this.name_714 ? Number(param1.name_714) : Number(this.name_714);
         this.name_699 = param1.name_699 < this.name_699 ? Number(param1.name_699) : Number(this.name_699);
         this.minZ = param1.minZ < this.minZ ? Number(param1.minZ) : Number(this.minZ);
         this.name_738 = param1.name_738 > this.name_738 ? Number(param1.name_738) : Number(this.name_738);
         this.name_739 = param1.name_739 > this.name_739 ? Number(param1.name_739) : Number(this.name_739);
         this.name_760 = param1.name_760 > this.name_760 ? Number(param1.name_760) : Number(this.name_760);
      }
      
      public function method_1663(param1:Number, param2:Number, param3:Number) : void
      {
         if(param1 < this.name_714)
         {
            this.name_714 = param1;
         }
         if(param1 > this.name_738)
         {
            this.name_738 = param1;
         }
         if(param2 < this.name_699)
         {
            this.name_699 = param2;
         }
         if(param2 > this.name_739)
         {
            this.name_739 = param2;
         }
         if(param3 < this.minZ)
         {
            this.minZ = param3;
         }
         if(param3 > this.name_760)
         {
            this.name_760 = param3;
         }
      }
      
      public function name_897() : void
      {
         this.name_714 = 1e+308;
         this.name_699 = 1e+308;
         this.minZ = 1e+308;
         this.name_738 = -1e+308;
         this.name_739 = -1e+308;
         this.name_760 = -1e+308;
      }
      
      public function name_1170(param1:name_767, param2:Number) : Boolean
      {
         return !(this.name_714 > param1.name_738 + param2 || this.name_738 < param1.name_714 - param2 || this.name_699 > param1.name_739 + param2 || this.name_739 < param1.name_699 - param2 || this.minZ > param1.name_760 + param2 || this.name_760 < param1.minZ - param2);
      }
      
      public function method_413(param1:name_767) : void
      {
         this.name_714 = param1.name_714;
         this.name_699 = param1.name_699;
         this.minZ = param1.minZ;
         this.name_738 = param1.name_738;
         this.name_739 = param1.name_739;
         this.name_760 = param1.name_760;
      }
      
      public function clone() : name_767
      {
         var _loc1_:name_767 = new name_767();
         _loc1_.method_413(this);
         return _loc1_;
      }
      
      public function name_952() : Number
      {
         return this.name_738 - this.name_714;
      }
      
      public function name_951() : Number
      {
         return this.name_739 - this.name_699;
      }
      
      public function name_950() : Number
      {
         return this.name_760 - this.minZ;
      }
      
      public function toString() : String
      {
         return "BoundBox [" + this.name_714 + ", " + this.name_699 + ", " + this.minZ + " : " + this.name_738 + ", " + this.name_739 + ", " + this.name_760 + "]";
      }
   }
}
