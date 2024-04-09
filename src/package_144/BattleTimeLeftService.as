package package_144
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.BattleSelectModel;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import projects.tanks.client.battleselect.name_386;
   
   public class BattleTimeLeftService implements name_465
   {
       
      
      private var var_2417:Dictionary;
      
      private var var_2420:Dictionary;
      
      protected var var_2418:Dictionary;
      
      protected var var_2419:Dictionary;
      
      public function BattleTimeLeftService()
      {
         this.var_2417 = new Dictionary();
         this.var_2420 = new Dictionary();
         this.var_2418 = new Dictionary();
         this.var_2419 = new Dictionary();
         super();
      }
      
      public function name_401(param1:String, param2:int, param3:int) : void
      {
         var _loc4_:Timer = this.var_2417[param1];
         if(_loc4_ == null)
         {
            _loc4_ = new Timer(3 * 1000);
            this.var_2420[_loc4_] = param1;
            this.var_2417[param1] = _loc4_;
            _loc4_.addEventListener(TimerEvent.TIMER,this.method_2420);
         }
         this.var_2418[param1] = param2 * 1000;
         this.var_2419[param1] = new Date().time + param3 * 1000;
         if(param3 > 0)
         {
            _loc4_.reset();
            _loc4_.start();
         }
      }
      
      public function name_438(param1:String) : void
      {
         var _loc2_:Timer = this.var_2417[param1];
         if(_loc2_ != null)
         {
            _loc2_.stop();
            _loc2_.removeEventListener(TimerEvent.TIMER,this.method_2420);
            delete this.var_2420[_loc2_];
            _loc2_ = null;
         }
         delete this.var_2417[param1];
         delete this.var_2418[param1];
         delete this.var_2419[param1];
      }
      
      public function name_456(param1:String) : void
      {
         var _loc2_:Timer = this.var_2417[param1];
         _loc2_.stop();
         this.method_2419(param1,1);
      }
      
      public function startBattle(param1:String) : void
      {
         this.var_2419[param1] = new Date().time + this.var_2418[param1];
         var _loc2_:Timer = this.var_2417[param1];
         _loc2_.start();
      }
      
      private function method_2420(param1:TimerEvent) : void
      {
         var _loc2_:String = String(this.var_2420[param1.target]);
         this.method_2419(_loc2_,this.method_1168(_loc2_));
      }
      
      protected function method_2419(param1:String, param2:Number) : void
      {
         var _loc3_:BattleSelectModel = OSGi.getInstance().getService(name_386) as BattleSelectModel;
         if(_loc3_ != null)
         {
            _loc3_.method_1981(param1,param2);
         }
      }
      
      public function method_1168(param1:String) : Number
      {
         var _loc2_:Number = Number(this.var_2418[param1]);
         var _loc3_:Number = (this.var_2419[param1] - new Date().time) / _loc2_;
         if(_loc3_ <= 0)
         {
            _loc3_ = 1;
         }
         return _loc3_;
      }
   }
}
