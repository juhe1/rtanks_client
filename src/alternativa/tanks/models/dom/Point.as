package alternativa.tanks.models.dom
{
   import alternativa.tanks.models.dom.hud.KeyPointView;
   import package_242.name_662;
   import package_278.name_2882;
   import package_37.Vector3;
   import package_40.TankSpawnState;
   import package_68.name_175;
   
   public class Point
   {
      
      private static const const_2229:name_662 = new name_662("dom_smoothing_factor",0.95,0,1);
      
      private static const const_414:Number = 100;
       
      
      public var pos:Vector3;
      
      private var radius:Number;
      
      private var model:DOMModel;
      
      private var capture:name_2882;
      
      public var id:int;
      
      public var view:KeyPointView;
      
      private var var_2866:Number = 0;
      
      public var name_2228:Number = 0;
      
      private var var_2864:Number = 0;
      
      private var var_2865:Boolean;
      
      public function Point(param1:int, param2:Vector3, param3:Number, param4:DOMModel, param5:KeyPointView)
      {
         this.capture = new name_2882("capture");
         super();
         this.pos = param2;
         this.radius = param3;
         this.model = param4;
         this.id = param1;
         this.view = param5;
      }
      
      public function drawDebug(param1:name_175) : void
      {
      }
      
      public function tick(param1:int, param2:int, param3:Number, param4:Number) : void
      {
         var _loc5_:Vector3 = null;
         var _loc6_:Number = NaN;
         if(DOMModel.var_588 == null)
         {
            return;
         }
         if(DOMModel.var_588.name_87 == TankSpawnState.ACTIVE)
         {
            _loc5_ = DOMModel.var_588.tank.state.position;
            _loc6_ = this.pos.distanceTo(_loc5_);
            if(!this.capture.value)
            {
               if(_loc6_ <= this.radius)
               {
                  this.capture.value = true;
                  this.model.method_1939(this,DOMModel.var_588);
               }
            }
            else if(_loc6_ > this.radius)
            {
               this.capture.value = false;
               this.model.method_1938(this,DOMModel.var_588);
            }
         }
         else if(this.capture.value)
         {
            this.capture.value = false;
            this.model.method_1938(this,DOMModel.var_588);
         }
      }
      
      public function name_2238(param1:Vector3) : void
      {
         param1.x = this.pos.x;
         param1.y = this.pos.y;
         param1.z = this.pos.z;
      }
   }
}
