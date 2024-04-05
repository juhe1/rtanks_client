package package_42
{
   import alternativa.physics.PhysicsScene;
   import alternativa.physics.collision.name_774;
   import alternativa.physics.name_660;
   import alternativa.tanks.battle.BattleRunner;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.utils.name_2391;
   import alternativa.tanks.vehicles.tanks.TankBody;
   import package_37.Vector3;
   
   public class name_1155
   {
      
      private static const const_1764:Number = 200;
       
      
      private var var_1978:name_2391;
      
      public var name_678:PhysicsScene;
      
      public var name_247:TanksCollisionDetector;
      
      public function name_1155(param1:int, param2:Number)
      {
         super();
         this.name_678 = new PhysicsScene();
         this.name_678.gravity.reset(0,0,-param2);
         this.var_1978 = new name_2391(this.name_678.gravity);
         this.name_678.var_1682 = 4;
         this.name_678.var_1681 = 4;
         this.name_678.var_1684 = 5;
         this.name_247 = new TanksCollisionDetector();
         this.name_678.name_247 = this.name_247;
         this.name_678.time = param1;
      }
      
      public function method_923() : int
      {
         return this.name_678.time;
      }
      
      public function method_930(param1:Vector.<name_774>) : void
      {
         this.name_247.name_754(param1);
      }
      
      public function name_778() : TanksCollisionDetector
      {
         return this.name_247;
      }
      
      public function method_2081() : PhysicsScene
      {
         return this.name_678;
      }
      
      public function name_1395(param1:TankBody) : void
      {
         this.name_678.name_1395(param1.name_787);
         this.name_247.method_709(param1);
      }
      
      public function name_1392(param1:TankBody) : void
      {
         this.name_678.name_1392(param1.name_787);
         this.name_247.method_711(param1);
      }
      
      public function destroy() : void
      {
         this.name_247.destroy();
      }
      
      public function update(param1:int) : void
      {
         if(this.var_1978.name_940())
         {
            this.name_678.update(param1);
            this.method_2080();
         }
         else
         {
            this.name_678.time = int.MAX_VALUE;
         }
      }
      
      private function method_2080() : void
      {
         var _loc6_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc1_:TankBody = null;
         var _loc2_:name_660 = null;
         var _loc3_:Vector3 = null;
         var _loc4_:Vector3 = null;
         var _loc5_:Number = NaN;
         _loc6_ = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         _loc9_ = NaN;
         for each(_loc1_ in this.name_247.method_697())
         {
            _loc2_ = _loc1_.name_787;
            _loc3_ = _loc2_.state.name_187;
            _loc4_ = BattleUtils.var_351;
            _loc2_.state.orientation.method_675(_loc4_);
            _loc5_ = _loc3_.x * _loc4_.x + _loc3_.y * _loc4_.y + _loc3_.z * _loc4_.z;
            if(_loc4_.z < -0.1 || _loc4_.z < 0.1 && _loc5_ < 0)
            {
               _loc5_ = -_loc5_;
               _loc4_.reverse();
            }
            _loc1_.method_1873();
            if(_loc1_.name_1168 || _loc1_.name_1175 || _loc1_.method_1878() || !_loc1_.method_1874())
            {
               _loc6_ = 200;
               if(!_loc1_.name_1168 && _loc1_.method_1874() && _loc1_.var_1706 > _loc6_)
               {
                  _loc6_ = _loc1_.var_1706;
               }
               _loc7_ = _loc1_.name_961.vDot(_loc4_);
               _loc8_ = _loc7_ * _loc1_.name_787.invMass * BattleRunner.const_444 / 1000;
               if(_loc8_ < 200)
               {
                  _loc8_ = 0;
               }
               _loc6_ = Math.max(_loc8_,_loc6_);
               if(_loc5_ > _loc6_)
               {
                  _loc9_ = _loc5_ - _loc6_;
                  _loc3_.x -= _loc9_ * _loc4_.x;
                  _loc3_.y -= _loc9_ * _loc4_.y;
                  _loc3_.z -= _loc9_ * _loc4_.z;
                  _loc5_ = _loc6_;
               }
            }
            _loc1_.var_1706 = _loc5_;
            _loc1_.name_961.reset();
         }
      }
      
      public function method_929() : Number
      {
         return this.name_678.gravity.z;
      }
   }
}
