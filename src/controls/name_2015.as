package controls
{
   import assets.icons.InputCheckIcon;
   import utils.tweener.TweenLite;
   
   public class name_2015 extends InputCheckIcon
   {
      
      private static const OFF:int = 0;
      
      private static const PROGRESS:int = 1;
      
      private static const const_2097:int = 2;
      
      private static const const_2098:int = 3;
       
      
      public var var_1411:Number;
      
      private var var_1784:int = -1;
      
      public function name_2015()
      {
         super();
         this.name_2024();
      }
      
      private function method_2585(param1:Boolean) : void
      {
         visible = param1;
         if(!visible)
         {
            gotoAndStop(this.var_1784);
            if(this.var_1784 != 0)
            {
               visible = true;
               if(this.var_1411 > 0)
               {
                  alpha = 0;
                  TweenLite.name_2095(this,this.var_1411,{"alpha":1});
               }
            }
         }
      }
      
      private function method_530(param1:int) : void
      {
         if(this.var_1784 != param1)
         {
            this.var_1784 = param1;
            if(this.var_1411 > 0)
            {
               TweenLite.name_2095(this,this.var_1411,{
                  "alpha":0,
                  "onComplete":this.method_2585,
                  "onCompleteParams":[false]
               });
            }
            else
            {
               this.method_2585(false);
            }
         }
      }
      
      public function method_285() : void
      {
         this.method_530(1);
      }
      
      public function name_2024() : void
      {
         this.method_530(0);
      }
      
      public function name_2027() : void
      {
         this.method_530(2);
      }
      
      public function name_2017() : void
      {
         this.method_530(3);
      }
   }
}
