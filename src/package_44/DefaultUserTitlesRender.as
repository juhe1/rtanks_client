package package_44
{
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_1.Main;
   import package_120.UserInfoService;
   import package_120.name_408;
   import package_37.Vector3;
   import package_42.TanksCollisionDetector;
   import package_42.name_73;
   import package_47.BattleTeamType;
   import package_48.UserTitle;
   import package_48.name_92;
   import package_61.RayHit;
   
   public class DefaultUserTitlesRender implements name_99
   {
       
      
      private var var_61:Number = 7000;
      
      private var var_59:Number = 7050;
      
      private var battlefield:IBattleField;
      
      public var localUserData:TankData;
      
      private var point:Vector3;
      
      private var var_47:Vector3;
      
      private var var_54:Vector3;
      
      private var var_55:RayHit;
      
      public function DefaultUserTitlesRender()
      {
         this.point = new Vector3();
         this.var_47 = new Vector3();
         this.var_54 = new Vector3();
         this.var_55 = new RayHit();
         super();
      }
      
      public function method_84(param1:TankData, param2:Vector3) : void
      {
         var _loc4_:Vector3 = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc3_:Tank = param1.tank;
         if(param1.health <= 0)
         {
            param1.tank.title.hide();
         }
         else if(!param1.local && TankData.localTankData != null)
         {
            if(!this.method_64(TankData.localTankData.teamType,param1.teamType))
            {
               _loc4_ = _loc3_.state.position;
               _loc5_ = _loc4_.x - param2.x;
               _loc6_ = _loc4_.y - param2.y;
               _loc7_ = _loc4_.z - param2.z;
               _loc8_ = Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_ + _loc7_ * _loc7_);
               if(_loc8_ >= this.var_59 || this.method_67(param1,param2))
               {
                  _loc3_.title.hide();
               }
               else if(_loc8_ < this.var_61)
               {
                  _loc3_.title.show();
               }
            }
            else
            {
               _loc3_.title.show();
            }
         }
      }
      
      private function method_64(param1:BattleTeamType, param2:BattleTeamType) : Boolean
      {
         return param1 != BattleTeamType.NONE && param1 == param2;
      }
      
      private function method_67(param1:TankData, param2:Vector3) : Boolean
      {
         var _loc3_:TanksCollisionDetector = this.battlefield.getBattlefieldData().name_247;
         var _loc4_:Vector.<Vector3> = param1.tank.name_264;
         var _loc5_:int = int(_loc4_.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            this.point.vCopy(_loc4_[_loc6_]);
            if(this.method_81(this.point,param1,param2,_loc3_))
            {
               return false;
            }
            _loc6_++;
         }
         return true;
      }
      
      private function method_81(param1:Vector3, param2:TankData, param3:Vector3, param4:TanksCollisionDetector) : Boolean
      {
         param1.vTransformBy3(param2.tank.name_225);
         param1.vAdd(param2.tank.state.position);
         this.var_47.copy(param3);
         this.var_54.diff(param1,this.var_47);
         return !param4.name_251(this.var_47,this.var_54,name_73.name_252,1,null,this.var_55);
      }
      
      public function name_255(param1:TankData) : void
      {
         if(TankData.localTankData == null || TankData.localTankData.teamType == null)
         {
            return;
         }
         var _loc2_:int = name_92.const_68 | name_92.EFFECTS;
         if(this.method_64(param1.teamType,TankData.localTankData.teamType))
         {
            _loc2_ |= name_92.name_262;
         }
         var _loc3_:UserTitle = param1.tank.title;
         if(UserInfoService(Main.osgi.getService(name_408)).hasData(param1.userName))
         {
            _loc3_.name_971(UserInfoService(Main.osgi.getService(name_408)).getData(param1.userName).premium);
         }
         _loc3_.name_156(param1.userName);
         _loc3_.name_122(param1.userRank);
         _loc3_.name_227(param1.teamType);
         _loc3_.name_133(param1.health);
         _loc3_.name_207(_loc2_);
      }
      
      public function name_134(param1:IBattleField) : void
      {
         this.battlefield = param1;
      }
      
      public function name_116(param1:TankData) : void
      {
         this.localUserData = param1;
      }
      
      public function render() : void
      {
      }
   }
}
