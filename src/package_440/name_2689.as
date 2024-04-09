package package_440
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.weapon.machinegun.name_2410;
   import alternativa.tanks.services.objectpool.IObjectPoolService;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.class_177;
   import alternativa.tanks.sfx.name_132;
   import alternativa.tanks.sfx.name_1718;
   import flash.media.Sound;
   import package_1.Main;
   import package_37.Vector3;
   
   public class name_2689 implements class_177
   {
      
      private static const const_2571:int = 0;
      
      private static const const_2581:int = 1;
      
      private static const const_2576:int = 2;
      
      private static const const_2572:int = 3;
      
      private static const const_2574:int = 4;
      
      private static const const_1809:Number = 0.7;
      
      private static const const_2577:Number = 1.4;
      
      private static const const_2579:Number = 0.3;
      
      private static const const_2578:int = 115;
      
      private static const const_2575:int = 3520;
      
      private static const const_2582:int = 80;
      
      private static const const_2580:int = 100;
      
      private static const const_2573:int = 27;
      
      private static var var_138:IObjectPoolService;
       
      
      private var var_3311:int = 0;
      
      private var var_3314:Object3D;
      
      private var var_2020:Sound;
      
      private var var_2019:Sound;
      
      private var var_2012:Sound;
      
      private var var_2016:Sound;
      
      private var var_2017:Sound;
      
      private var var_3317:Sound3D;
      
      private var var_3316:Sound3D;
      
      private var var_3312:name_1718;
      
      private var var_3313:name_3280;
      
      private var var_3315:Number;
      
      private var var_3318:int;
      
      private var var_11:BattlefieldModel;
      
      public function name_2689(param1:Object3D, param2:name_2410, param3:Number)
      {
         super();
         this.var_3314 = param1;
         this.var_2020 = param2.chainStartSound;
         this.var_2019 = param2.turbineStartSound;
         this.var_2012 = param2.shootSound;
         this.var_2016 = param2.shootEndSound;
         this.var_2017 = param2.longFailSound;
         this.var_3317 = this.method_2988(param2.hitSound);
         this.var_3316 = this.method_2988(param2.tankHitSound);
         this.var_3315 = param3;
         var_138 = IObjectPoolService(Main.osgi.getService(IObjectPoolService));
         this.var_11 = Main.osgi.getService(IBattleField) as BattlefieldModel;
      }
      
      public function name_2694(param1:int) : void
      {
         var _loc2_:name_1718 = null;
         var _loc3_:Sound3D = null;
         if(this.var_3311 != 1)
         {
            this.var_3311 = 1;
            this.method_79(this.var_2019,3520 - this.var_3315);
            _loc2_ = name_1718(var_138.objectPool.getObject(name_1718));
            _loc3_ = Sound3D.create(this.var_2020,1000,5000,5,1.4);
            _loc2_.method_2487(_loc3_,this.var_3314);
            this.var_11.name_195(_loc2_);
         }
         this.var_3318 = param1;
      }
      
      public function name_2695() : void
      {
         if(this.var_3311 != 2)
         {
            this.var_3311 = 2;
            this.method_79(this.var_2012,80,1000000);
         }
      }
      
      public function name_2693() : void
      {
         if(this.var_3311 != 3)
         {
            this.var_3311 = 3;
            this.method_79(this.var_2016,100);
         }
      }
      
      public function name_2696(param1:int) : void
      {
         if(this.var_3311 != 4)
         {
            this.var_3311 = 4;
            this.method_79(this.var_2017,this.var_3315 - this.var_3318 + 27,0,param1);
         }
      }
      
      public function name_763() : void
      {
         if(this.var_3311 != 0)
         {
            this.var_3311 = 0;
            this.method_2987();
         }
      }
      
      private function method_79(param1:Sound, param2:int, param3:int = 0, param4:int = 0) : void
      {
         this.method_2987();
         this.var_3312 = name_1718(var_138.objectPool.getObject(name_1718));
         var _loc5_:Sound3D = this.method_2989(param1);
         this.var_3312.init(null,_loc5_,this.var_3314,0,param3,param2,this);
         this.var_11.name_195(this.var_3312);
         if(param4 > 0)
         {
            this.var_3312.name_2409(param4);
         }
      }
      
      public function name_2691(param1:Vector3, param2:Boolean) : void
      {
         if(this.var_3313 == null)
         {
            this.var_3313 = name_3280(var_138.objectPool.getObject(name_3280));
            this.var_3313.init(this.var_3317,this.var_3316);
            this.var_11.name_195(this.var_3313);
         }
         this.var_3313.name_758(param1,param2);
      }
      
      public function destroy() : void
      {
         this.method_2987();
         this.method_2990();
         this.var_2020 = null;
         this.var_2019 = null;
         this.var_2012 = null;
         this.var_2016 = null;
         this.var_2017 = null;
         this.var_3314 = null;
      }
      
      private function method_2990() : void
      {
         this.name_2692();
         this.var_3317 = null;
         this.var_3316 = null;
      }
      
      public function name_2692() : void
      {
         if(this.var_3313 != null)
         {
            this.var_3313.kill();
            this.var_3313 = null;
         }
      }
      
      public function method_2188(param1:name_132) : void
      {
         if(this.var_3312 == param1)
         {
            this.var_3312 = null;
         }
      }
      
      private function method_2989(param1:Sound) : Sound3D
      {
         return Sound3D.create(param1,1000,5000,5,0.7);
      }
      
      private function method_2988(param1:Sound) : Sound3D
      {
         return Sound3D.create(param1,1000,5000,5,0.3);
      }
      
      private function method_2987() : void
      {
         if(this.var_3312 != null)
         {
            this.var_3312.kill();
            this.var_3312 = null;
         }
      }
   }
}
