package package_42
{
   import alternativa.physics.ShapeContact;
   import alternativa.physics.name_888;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.vehicles.tanks.Tank;
   import alternativa.tanks.vehicles.tanks.TankBody;
   import package_1.Main;
   import package_276.name_906;
   import package_277.name_904;
   import package_37.Matrix4;
   import package_37.Vector3;
   
   public class SoaringChecker
   {
      
      public static var battleService:BattlefieldModel = Main.osgi.getService(IBattleField) as BattlefieldModel;
      
      private static const const_2212:Number = 12.5;
      
      private static const var_793:Vector.<ShapeContact> = new Vector.<ShapeContact>();
       
      
      private var tank:Tank;
      
      private var var_2827:name_904;
      
      private var var_2829:Boolean;
      
      private var var_2828:Boolean;
      
      private var var_2830:Boolean;
      
      public function SoaringChecker(param1:TankBody)
      {
         super();
         this.tank = param1.name_787.tank;
         var _loc2_:Vector3 = this.tank.method_481().hs.clone();
         _loc2_.z += 12.5;
         this.var_2827 = new name_904(_loc2_,-1,name_888.name_947);
         this.var_2827.name_787 = this.tank;
      }
      
      public function method_1873() : void
      {
         var _loc1_:ShapeContact = null;
         var _loc2_:Number = NaN;
         this.var_2829 = this.var_2828;
         this.method_2663();
         var _loc3_:TanksCollisionDetector = battleService.var_117.name_247;
         _loc3_.method_712(this.var_2827,var_793);
         var _loc4_:Number = 0;
         for each(_loc1_ in var_793)
         {
            if(_loc1_.shape1 == this.var_2827)
            {
               _loc2_ = _loc1_.normal.vDot(Vector3.Z_AXIS);
            }
            else
            {
               _loc2_ = _loc1_.normal.vDot(Vector3.DOWN);
            }
            _loc4_ = Math.max(_loc4_,_loc2_);
            _loc1_.dispose();
         }
         this.var_2830 = var_793.length > 0;
         var_793.length = 0;
         this.var_2828 = _loc4_ < name_906.const_1615;
      }
      
      private function method_2663() : void
      {
         var _loc1_:name_904 = this.tank.method_481();
         var _loc2_:Matrix4 = this.var_2827.transform;
         _loc2_.copy(_loc1_.transform);
         _loc2_.m03 -= _loc2_.m02 * 12.5;
         _loc2_.m13 -= _loc2_.m12 * 12.5;
         _loc2_.m23 -= _loc2_.m22 * 12.5;
         this.var_2827.calculateAABB();
      }
      
      public function method_1874() : Boolean
      {
         return this.var_2828;
      }
      
      public function method_1875() : Boolean
      {
         return this.var_2828 && !this.var_2829;
      }
      
      public function method_1877() : Boolean
      {
         return this.var_2829 && !this.var_2828;
      }
      
      public function method_1876() : Boolean
      {
         return this.var_2828 && this.var_2830;
      }
   }
}
