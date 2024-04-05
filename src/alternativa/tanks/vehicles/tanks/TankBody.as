package alternativa.tanks.vehicles.tanks
{
   import alternativa.physics.collision.name_774;
   import alternativa.physics.name_660;
   import package_277.name_904;
   import package_37.Vector3;
   import package_42.SoaringChecker;
   
   public class TankBody
   {
       
      
      public var id:int;
      
      public var name_787:name_660;
      
      public var name_908:name_904;
      
      public var name_1174:Vector.<name_774>;
      
      public var name_1168:Boolean;
      
      public var name_1171:Vector.<name_660>;
      
      public var name_1175:Boolean;
      
      public var name_961:Vector3;
      
      public var var_1706:Number = 0;
      
      private var var_1705:SoaringChecker;
      
      public function TankBody(param1:name_660)
      {
         this.name_1174 = new Vector.<name_774>();
         this.name_1171 = new Vector.<name_660>();
         this.name_961 = new Vector3();
         super();
         this.name_787 = param1;
      }
      
      public function name_960() : void
      {
         this.var_1705 = new SoaringChecker(this);
      }
      
      public function method_1878() : Boolean
      {
         return this.name_1171.length > 0;
      }
      
      public function destroy() : void
      {
         this.var_1705 = null;
         this.name_787 = null;
         this.name_1174 = null;
         this.name_1171 = null;
      }
      
      public function method_1873() : void
      {
         this.var_1705.method_1873();
      }
      
      public function method_1874() : Boolean
      {
         return this.var_1705.method_1874();
      }
      
      public function method_1875() : Boolean
      {
         return this.var_1705.method_1875();
      }
      
      public function method_1877() : Boolean
      {
         return this.var_1705.method_1877();
      }
      
      public function method_1876() : Boolean
      {
         return this.var_1705.method_1876();
      }
   }
}
