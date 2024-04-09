package alternativa.tanks.models.weapon.machinegun
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.sfx.LightDataManager;
   import alternativa.tanks.models.sfx.name_1714;
   import alternativa.tanks.models.sfx.name_1716;
   import alternativa.tanks.models.sfx.name_1717;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.weapon.machinegun.sfx.name_2687;
   import alternativa.tanks.models.weapon.machinegun.sfx.name_2688;
   import alternativa.tanks.services.objectpool.IObjectPoolService;
   import alternativa.tanks.sfx.name_1071;
   import alternativa.tanks.sfx.name_657;
   import alternativa.tanks.vehicles.tanks.TankSkin;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_24.LogLevel;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_440.name_2689;
   import package_7.name_11;
   import package_7.name_32;
   import package_92.name_1451;
   
   public class MachineGunEffects
   {
      
      private static const const_2006:Number = 0.1;
      
      private static const const_2008:Number = 50;
      
      private static const const_2004:Number = 0.001;
      
      private static const const_2000:Number = 15;
      
      private static const const_2005:Number = 0.59;
      
      private static const const_2002:Number = 0.1;
      
      private static const POW:Number = 3;
      
      private static const const_2009:int = 6;
      
      private static const const_2003:Number = 1.0471975511965976;
      
      private static const const_2001:int = 150;
      
      private static const const_2007:int = 200;
      
      private static const const_1999:int = 150;
      
      private static var var_138:IObjectPoolService;
       
      
      private var battlefield:IBattleField;
      
      private var var_895:class_75;
      
      private var name_694:Dictionary;
      
      private var var_421:BattlefieldModel;
      
      private var var_1045:name_1714;
      
      private var var_1046:name_1714;
      
      private var var_2443:Number;
      
      private var var_2442:name_2688;
      
      private var tankData:TankData;
      
      private var var_2448:name_1451;
      
      private var var_2447:Vector3;
      
      private var name_1422:Vector3;
      
      private var sfxData:name_2410;
      
      private var var_2446:Boolean;
      
      private var var_2445:Boolean;
      
      private var var_664:Vector3;
      
      private var soundManager:name_2689;
      
      private var var_2444:Boolean;
      
      private var state:Number;
      
      private var var_564:class_170;
      
      public function MachineGunEffects(param1:class_170)
      {
         this.var_664 = new Vector3();
         this.var_564 = param1;
         this.name_694 = new Dictionary();
         this.var_421 = Main.osgi.getService(IBattleField) as BattlefieldModel;
         super();
         this.var_2443 = 0;
         var_138 = IObjectPoolService(Main.osgi.getService(IObjectPoolService));
         this.method_1223();
      }
      
      public function name_1711(param1:Vector3, param2:Boolean) : void
      {
         this.var_2445 = true;
         this.var_2446 = param2;
         this.var_664.vCopy(param1);
         if(this.soundManager != null)
         {
            this.soundManager.name_2691(param1,param2);
         }
         if(this.var_2442 != null)
         {
            this.var_2442.name_1711(param1,param2);
         }
      }
      
      public function name_1710(param1:Boolean) : void
      {
         this.var_2445 = false;
         if(this.soundManager != null)
         {
            this.soundManager.name_2692();
         }
         if(this.var_2442 != null)
         {
            this.var_2442.name_1710(param1);
         }
      }
      
      public function update(param1:int, param2:Number, param3:Boolean, param4:TankData, param5:name_1451, param6:TankSkin, param7:Vector3, param8:Vector3, param9:Number, param10:Number) : void
      {
         var _loc13_:String = null;
         if(this.var_2442 != null)
         {
            this.var_2442.name_2690(param7,param8);
         }
         this.state = param2;
         this.sfxData = this.var_564.method_1239(param4.turret);
         if(this.sfxData == null)
         {
            _loc13_ = "SFX data not found";
            name_11.log(LogLevel.name_79,_loc13_);
            throw new Error(_loc13_);
         }
         if(this.soundManager == null)
         {
            this.soundManager = new name_2689(param6.name_200,this.sfxData,param9);
         }
         this.playSound(param2,param3,param9,param10);
         this.tankData = param4;
         this.var_2448 = param5;
         this.var_2447 = param7;
         this.name_1422 = param8;
         var _loc11_:Boolean = param2 == 1;
         var _loc12_:Number = param1 / 1000;
         this.var_2443 += _loc12_;
         if(_loc11_)
         {
            this.method_2470(_loc12_);
         }
         else
         {
            this.name_1706(this.tankData);
         }
         this.method_2469(_loc12_,param2);
      }
      
      private function playSound(param1:Number, param2:Boolean, param3:Number, param4:Number) : void
      {
         if(param2)
         {
            if(param1 == 1)
            {
               this.soundManager.name_2695();
               this.var_2444 = true;
            }
            else
            {
               this.soundManager.name_2694(param3 * param1);
            }
         }
         else if(param1 == 0)
         {
            this.var_2444 = false;
            this.soundManager.name_763();
         }
         else if(this.var_2444)
         {
            this.soundManager.name_2693();
         }
         else
         {
            this.soundManager.name_2696(param1 * param4);
         }
      }
      
      public function name_1706(param1:TankData) : void
      {
         this.name_1710(false);
         this.method_2472();
         if(this.soundManager != null && this.state >= 1)
         {
            this.soundManager.name_763();
         }
         var _loc2_:name_657 = this.name_694[param1];
         if(_loc2_ != null)
         {
            delete this.name_694[param1];
            _loc2_.kill();
            if(this.var_1045 != null)
            {
               this.var_1045.stop();
               this.var_1045 = null;
            }
            if(this.var_1046 != null)
            {
               this.var_1046.stop();
               this.var_1046 = null;
            }
         }
      }
      
      private function method_2472() : void
      {
         if(this.var_2442 != null)
         {
            this.var_2442.stop();
            this.var_2442 = null;
         }
      }
      
      private function method_2470(param1:Number) : void
      {
         this.method_2473();
         if(this.var_2445 && this.var_2443 >= 0.1)
         {
            this.var_2443 = 0;
            this.method_2471();
         }
      }
      
      private function ease(param1:Number, param2:Number) : Number
      {
         if(param1 < 0.5)
         {
            param1 *= 2;
            param1 = Math.pow(param1,param2);
            return param1 / 2;
         }
         param1 = 1 - (param1 - 0.5) * 2;
         param1 = Math.pow(param1,param2);
         return (1 - param1) / 2 + 0.5;
      }
      
      private function method_2471() : void
      {
         var _loc1_:name_1071 = null;
         var _loc2_:name_2687 = null;
         if(!this.var_2446)
         {
            _loc1_ = name_1071(var_138.objectPool.getObject(name_1071));
            _loc1_.init(this.var_664,50);
            _loc2_ = name_2687(var_138.objectPool.getObject(name_2687));
            _loc2_.init(_loc1_,this.sfxData);
            this.battlefield.name_217(_loc2_);
         }
      }
      
      private function method_2473() : void
      {
         if(this.var_2442 == null)
         {
            this.var_2442 = name_2688(var_138.objectPool.getObject(name_2688));
            this.var_2442.init(this.tankData.tank.skin.name_200,this.sfxData,this.var_2447,this.name_1422);
            this.battlefield.name_217(this.var_2442);
            this.name_694[this.tankData] = this.var_2442;
            this.method_1237(this.var_2448.muzzles[0],this.tankData.tank.skin.name_200,this.tankData.turret);
         }
      }
      
      private function method_2469(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = 15 * param2;
         if(_loc3_ > 0.001)
         {
            this.tankData.tank.skin.method_738().method_2108()[1].rotationY = this.tankData.tank.skin.method_738().method_2108()[1].rotationY + _loc3_ * param1;
         }
      }
      
      public function method_1237(param1:Vector3, param2:Object3D, param3:ClientObject) : void
      {
         var _loc4_:name_1716 = null;
         var _loc5_:name_1717 = null;
         if(this.var_1045 == null)
         {
            this.var_1045 = name_1714(var_138.objectPool.getObject(name_1714));
            _loc4_ = name_1716(var_138.objectPool.getObject(name_1716));
            _loc4_.init(param2,param1);
            this.var_1045.init(_loc4_,LightDataManager.name_1250(param3.id),LightDataManager.name_1723(param3.id));
            this.var_421.name_217(this.var_1045);
         }
         if(this.var_1046 == null)
         {
            this.var_1046 = name_1714(var_138.objectPool.getObject(name_1714));
            _loc5_ = name_1717(var_138.objectPool.getObject(name_1717));
            _loc5_.init(param2,param1,this.var_421.var_117.name_247,1500);
            this.var_1046.init(_loc5_,LightDataManager.name_1250(param3.id),LightDataManager.name_1723(param3.id));
            this.var_421.name_217(this.var_1046);
         }
      }
      
      private function method_1223() : void
      {
         var _loc1_:name_32 = null;
         if(this.battlefield == null)
         {
            _loc1_ = name_32(Main.osgi.getService(name_32));
            this.battlefield = IBattleField(Main.osgi.getService(IBattleField));
            this.var_895 = class_75(_loc1_.getModelsByInterface(class_75)[0]);
         }
      }
   }
}
