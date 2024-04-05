package controls.base
{
   import controls.name_2015;
   import flash.events.FocusEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import forms.name_1139;
   import package_280.name_2014;
   
   public class name_1955 extends name_2016
   {
       
      
      private const const_1549:int = 500;
      
      private var var_2649:Timer;
      
      private var var_2647:name_2015;
      
      private var var_2646:name_1134;
      
      private var var_2653:Function;
      
      private var var_2648:Boolean;
      
      private var var_2651:Boolean = false;
      
      private var var_2652:Boolean = false;
      
      private var var_2650:Boolean = false;
      
      public function name_1955(param1:String, param2:Boolean = false)
      {
         this.var_2646 = new name_1134();
         super();
         this.var_2648 = param2;
         this.var_2646.text = param1;
         this.var_2646.mouseEnabled = false;
         this.var_2646.color = name_1139.name_2023;
         addChild(this.var_2646);
         if(this.var_2648)
         {
            this.var_2647 = new name_2015();
            addChild(this.var_2647);
            this.var_2649 = new Timer(500,1);
            this.var_2649.addEventListener(TimerEvent.TIMER_COMPLETE,this.method_2580);
         }
         addEventListener(FocusEvent.FOCUS_IN,this.method_2581);
         addEventListener(FocusEvent.FOCUS_OUT,this.method_2578);
         addEventListener(name_2014.name_2020,this.method_2579);
         this.resize();
      }
      
      public function name_940() : Boolean
      {
         return this.var_2651;
      }
      
      private function resize() : void
      {
         this.var_2646.x = 3;
         this.var_2646.y = 7;
         if(this.var_2648)
         {
            this.var_2647.x = width - 33;
            this.var_2647.y = 7;
         }
      }
      
      private function method_2581(param1:FocusEvent) : void
      {
         this.var_2646.visible = false;
      }
      
      private function method_2578(param1:FocusEvent) : void
      {
         if(value.length == 0)
         {
            this.var_2646.visible = true;
         }
      }
      
      private function method_2579(param1:name_2014) : void
      {
         if(!this.var_2648)
         {
            return;
         }
         if(value.length == 0)
         {
            this.var_2647.name_2024();
         }
         this.var_2649.reset();
         this.var_2649.start();
         this.var_2650 = true;
      }
      
      public function name_1960() : void
      {
         this.var_2650 = false;
         if(this.var_2648)
         {
            this.var_2651 = true;
            validValue = true;
            this.var_2647.name_2027();
         }
      }
      
      public function get name_1958() : Boolean
      {
         return this.var_2650;
      }
      
      public function name_1959() : void
      {
         this.var_2650 = false;
         if(this.var_2648)
         {
            this.var_2651 = false;
            validValue = false;
            this.var_2647.name_2017();
         }
      }
      
      private function method_2580(param1:TimerEvent) : void
      {
         if(value.length > 0)
         {
            this.var_2647.method_285();
            if(this.validateFunction != null)
            {
               this.validateFunction.call(this);
            }
         }
      }
      
      public function set validateFunction(param1:Function) : void
      {
         this.var_2653 = param1;
      }
      
      public function get validateFunction() : Function
      {
         return this.var_2653;
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this.resize();
      }
      
      override public function set enable(param1:Boolean) : void
      {
         super.enable = param1;
         this.var_2652 = param1;
      }
      
      public function var_466() : Boolean
      {
         return this.var_2652;
      }
   }
}
