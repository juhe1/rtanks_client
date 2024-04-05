package package_293
{
   import flash.events.Event;
   
   public class name_2336 extends IconField
   {
       
      
      protected var _value:int;
      
      protected var var_2271:int;
      
      private var var_2270:WinkManager;
      
      public function name_2336(param1:int, param2:int, param3:WinkManager)
      {
         super(param2);
         this.var_2271 = param1;
         this.var_2270 = param3;
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_886);
      }
      
      public function set value(param1:int) : void
      {
         this._value = param1;
         this.method_664();
         if(this._value <= this.var_2271)
         {
            this.name_2341();
         }
         else
         {
            this.name_2339();
         }
      }
      
      public function name_2341() : void
      {
         if(this.var_2270 != null)
         {
            this.var_2270.method_2066(this);
         }
      }
      
      public function name_2339() : void
      {
         if(this.var_2270 != null)
         {
            this.var_2270.method_2067(this);
         }
         label.visible = true;
      }
      
      public function get textVisible() : Boolean
      {
         return label.visible;
      }
      
      public function set textVisible(param1:Boolean) : void
      {
         label.visible = param1;
      }
      
      protected function method_664() : void
      {
         text = this._value.toString();
      }
      
      protected function method_886(param1:Event) : void
      {
         this.name_2339();
      }
   }
}
