package alternativa.tanks.battle
{
   import alternativa.physics.collision.CollisionPrimitive;
   import alternativa.physics.Body;
   import alternativa.tanks.models.battlefield.logic.class_23;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.class_12;
   import alternativa.tanks.utils.name_1388;
   import alternativa.tanks.utils.name_1391;
   import alternativa.tanks.vehicles.tanks.TankBody;
   import flash.media.Sound;
   import flash.utils.getTimer;
   import package_239.SoundManager;
   import package_239.name_655;
   import package_317.name_1385;
   import package_317.name_1386;
   import package_317.name_1387;
   import package_317.name_1389;
   import package_318.Triggers;
   import package_42.TankBodyIdProvider;
   import package_42.TanksCollisionDetector;
   import package_42.name_1155;
   import package_46.name_96;
   
   public class BattleRunner
   {
      
      public static var battleService:IBattleField;
      
      public static var localTankInfoService:class_12;
      
      public static const const_444:int = 33;
      
      public static const const_445:Number = 0.033;
      
      private static const const_442:name_1391 = new name_1388(1000);
       
      
      private var time:int;
      
      private var var_680:int;
      
      private var var_676:Vector.<class_23>;
      
      private var var_677:Vector.<class_23>;
      
      private var var_678:Boolean;
      
      private var var_673:Vector.<class_19>;
      
      private var var_674:Vector.<class_21>;
      
      private var var_672:Vector.<class_22>;
      
      private var var_679:Vector.<name_1384>;
      
      private var var_681:Body;
      
      private var var_675:Boolean;
      
      private var soundManager:name_655;
      
      private var battleEventDispatcher:name_96;
      
      private const const_443:Triggers = new Triggers();
      
      public var name_678:name_1155;
      
      public function BattleRunner(param1:Number, param2:Sound, param3:name_96)
      {
         this.var_676 = new Vector.<class_23>();
         this.var_677 = new Vector.<class_23>();
         this.var_673 = new Vector.<class_19>();
         this.var_674 = new Vector.<class_21>();
         this.var_672 = new Vector.<class_22>();
         this.var_679 = new Vector.<name_1384>();
         super();
         this.battleEventDispatcher = param3;
         this.time = getTimer();
         this.name_678 = new name_1155(this.time,param1);
         this.soundManager = SoundManager.name_736(param2);
         this.var_680 = this.time;
         TankBodyIdProvider.name_1393();
      }
      
      public function method_937() : name_655
      {
         return this.soundManager;
      }
      
      public function method_930(param1:Vector.<CollisionPrimitive>) : void
      {
         this.name_678.method_930(param1);
      }
      
      public function name_778() : TanksCollisionDetector
      {
         return this.name_678.name_778();
      }
      
      public function method_935(param1:class_23) : void
      {
         if(this.var_676.indexOf(param1) < 0)
         {
            this.var_676.push(param1);
         }
      }
      
      public function method_936(param1:class_23) : void
      {
         this.method_924(param1,this.var_676);
      }
      
      public function name_212(param1:class_23) : void
      {
         if(this.var_678)
         {
            this.method_922(new name_1386(param1,true));
         }
         else if(this.var_677.indexOf(param1) < 0)
         {
            this.var_677.push(param1);
         }
      }
      
      public function name_977(param1:class_23) : void
      {
         if(this.var_678)
         {
            this.method_922(new name_1386(param1,false));
         }
         else
         {
            this.method_924(param1,this.var_677);
         }
      }
      
      private function method_924(param1:class_23, param2:Vector.<class_23>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = param2.indexOf(param1);
         if(_loc4_ >= 0)
         {
            _loc3_ = param2.length - 1;
            param2[_loc4_] = param2[_loc3_];
            param2.length = _loc3_;
         }
      }
      
      public function method_180(param1:name_712) : void
      {
         this.const_443.add(param1);
      }
      
      public function method_173(param1:name_712) : void
      {
         this.const_443.remove(param1);
      }
      
      public function name_194(param1:Body) : void
      {
         this.var_681 = param1;
      }
      
      public function name_762(param1:TankBody) : void
      {
         this.name_678.name_1395(param1);
      }
      
      public function name_765(param1:TankBody) : void
      {
         this.name_678.name_1392(param1);
         if(this.var_681 == param1.name_787)
         {
            this.name_194(null);
         }
      }
      
      public function name_746(param1:class_19) : void
      {
         if(this.var_675)
         {
            this.method_922(new name_1385(param1,true));
         }
         else if(this.var_673.indexOf(param1) < 0)
         {
            this.var_673.push(param1);
         }
      }
      
      public function name_772(param1:class_19) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.var_675)
         {
            this.method_922(new name_1385(param1,false));
         }
         else
         {
            _loc2_ = int(this.var_673.length);
            if(_loc2_ > 0)
            {
               _loc3_ = this.var_673.indexOf(param1);
               if(_loc3_ >= 0)
               {
                  this.var_673.splice(_loc3_,1);
               }
            }
         }
      }
      
      public function name_747(param1:class_21) : void
      {
         if(this.var_675)
         {
            this.method_922(new name_1389(param1));
         }
         else if(this.var_674.indexOf(param1) < 0)
         {
            this.var_674.push(param1);
         }
      }
      
      public function name_724(param1:class_21) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.var_675)
         {
            this.method_922(new name_1387(param1));
         }
         else
         {
            _loc2_ = int(this.var_674.length);
            if(_loc2_ > 0)
            {
               _loc3_ = this.var_674.indexOf(param1);
               if(_loc3_ >= 0)
               {
                  this.var_674.splice(_loc3_,1);
               }
            }
         }
      }
      
      public function name_784(param1:class_22) : void
      {
         if(this.var_672.indexOf(param1) < 0)
         {
            this.var_672.push(param1);
         }
      }
      
      public function name_753(param1:class_22) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this.var_672.length);
         if(_loc3_ > 0)
         {
            _loc2_ = this.var_672.indexOf(param1);
            if(_loc2_ >= 0)
            {
               this.var_672[_loc2_] = this.var_672[--_loc3_];
               this.var_672.length = _loc3_;
            }
         }
      }
      
      public function tick() : void
      {
         var _loc1_:int = getTimer();
         var _loc2_:int = _loc1_ - this.time;
         this.time = _loc1_;
         this.method_932(this.time,_loc2_);
         this.method_926(33);
         battleService.getBattlefieldData().viewport.update(this.time,_loc2_);
         if(battleService.method_143() != null)
         {
            battleService.method_143().update(battleService.getBattlefieldData().viewport.camera,this.time,_loc2_);
         }
         this.soundManager.name_723(_loc2_,battleService.getBattlefieldData().viewport.camera);
      }
      
      private function method_932(param1:int, param2:int) : void
      {
         var _loc3_:int = int(this.var_676.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_676[_loc4_].method_504(param1,param2);
            _loc4_++;
         }
      }
      
      public function name_781() : void
      {
         this.soundManager.name_686();
         this.soundManager.name_701();
         this.name_678.destroy();
      }
      
      private function method_931(param1:int) : void
      {
         var _loc2_:class_23 = null;
         var _loc3_:int = param1 - this.var_680;
         this.var_680 = param1;
         this.var_678 = true;
         var _loc4_:int = int(this.var_677.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_677[_loc5_];
            _loc2_.method_504(param1,_loc3_);
            _loc5_++;
         }
         this.var_678 = false;
         this.method_925();
      }
      
      private function method_926(param1:int) : void
      {
         while(this.name_678.method_923() < this.time)
         {
            this.method_927();
            this.method_931(this.method_923());
            this.var_675 = true;
            this.method_933(param1 / const_442.name_1390());
            this.name_678.update(param1);
            this.method_928(param1 / const_442.name_1390());
            this.const_443.name_1394(this.var_681);
            this.var_675 = false;
            this.method_925();
         }
         this.method_934(param1);
      }
      
      private function method_927() : void
      {
      }
      
      private function method_933(param1:Number) : void
      {
         var _loc2_:class_19 = null;
         var _loc3_:int = int(this.var_673.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_673[_loc4_];
            _loc2_.method_426(param1);
            _loc4_++;
         }
      }
      
      private function method_928(param1:Number) : void
      {
         var _loc2_:class_21 = null;
         var _loc3_:int = int(this.var_674.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_674[_loc4_];
            _loc2_.method_464(param1);
            _loc4_++;
         }
      }
      
      private function method_934(param1:int) : void
      {
         var _loc2_:class_22 = null;
         var _loc3_:Number = 1 + (this.time - this.name_678.method_923()) / 33;
         var _loc4_:int = int(this.var_672.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_672[_loc5_];
            _loc2_.method_465(_loc3_,param1);
            _loc5_++;
         }
      }
      
      private function method_922(param1:name_1384) : void
      {
         this.var_679.push(param1);
      }
      
      private function method_925() : void
      {
         var _loc1_:name_1384 = null;
         while((_loc1_ = this.var_679.pop()) != null)
         {
            _loc1_.execute();
         }
      }
      
      public function method_923() : int
      {
         return this.name_678.method_923();
      }
      
      public function getTime() : int
      {
         return this.time;
      }
      
      public function method_929() : Number
      {
         return this.name_678.method_929();
      }
      
      public function name_744() : Number
      {
         return 1 + (this.time - this.name_678.method_923()) / 33;
      }
   }
}
