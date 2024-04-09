package alternativa.tanks.models.battlefield
{
   import alternativa.tanks.models.battlefield.logic.class_23;
   import flash.display.Stage;
   import flash.display.StageQuality;
   import package_12.name_24;
   import package_3.GPUCapabilities;
   
   public class name_284 implements class_23
   {
      
      public static var battleService:IBattleField;
      
      public static var display:name_24;
      
      private static const const_410:Number = 60;
      
      private static const const_411:Number = 40;
      
      private static const const_409:int = 10;
      
      private static const const_412:int = 30;
       
      
      private var stage:Stage;
      
      private var var_606:name_668;
      
      private var var_604:int;
      
      private var frameCounter:int;
      
      private var var_608:Number;
      
      private var var_607:String;
      
      private var var_605:Boolean;
      
      public function name_284(param1:Stage, param2:name_668)
      {
         super();
         this.stage = param1;
         this.var_606 = param2;
         this.method_831();
         this.method_825();
         this.method_827();
      }
      
      private function method_825() : void
      {
         this.var_608 = this.stage.frameRate;
         this.var_607 = this.stage.quality;
      }
      
      private function method_827() : void
      {
         this.stage.frameRate = this.var_604;
         if(GPUCapabilities.method_95)
         {
            this.stage.quality = StageQuality.MEDIUM;
         }
         else
         {
            this.stage.quality = StageQuality.LOW;
         }
      }
      
      public function name_766() : void
      {
         this.stage.frameRate = this.var_608;
         this.stage.quality = this.var_607;
      }
      
      private function method_831() : void
      {
         if(GPUCapabilities.method_95)
         {
            this.var_604 = 60;
         }
         else
         {
            this.var_604 = 40;
         }
      }
      
      public function name_674(param1:Boolean) : void
      {
         if(param1)
         {
            this.method_826();
         }
         else
         {
            this.method_829();
         }
      }
      
      private function method_826() : void
      {
         if(!this.var_605)
         {
            battleService.name_165().name_212(this);
            this.var_605 = true;
         }
      }
      
      private function method_829() : void
      {
         if(this.var_605)
         {
            battleService.name_165().name_977(this);
            this.var_605 = false;
            this.stage.frameRate = this.var_604;
         }
      }
      
      public function method_504(param1:int, param2:int) : void
      {
         ++this.frameCounter;
         if(this.frameCounter == 30)
         {
            this.frameCounter = 0;
            if(this.method_832())
            {
               this.method_828();
            }
            else
            {
               this.method_830();
            }
         }
      }
      
      private function method_832() : Boolean
      {
         return this.var_606.fps < display.stage.frameRate - 1;
      }
      
      private function method_828() : void
      {
         display.stage.frameRate = this.var_606.fps < 10 ? Number(10) : Number(this.var_606.fps);
      }
      
      private function method_830() : void
      {
         var _loc1_:Number = display.stage.frameRate + 1;
         display.stage.frameRate = _loc1_ > this.var_604 ? Number(this.var_604) : Number(_loc1_);
      }
   }
}
