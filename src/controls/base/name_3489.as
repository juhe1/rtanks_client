package controls.base
{
   import flash.utils.setTimeout;
   import forms.name_1139;
   
   public class name_3489 extends name_2016
   {
       
      
      public function name_3489()
      {
         super();
      }
      
      override public function set enable(param1:Boolean) : void
      {
         super.enable = param1;
         setTimeout(this.method_3299,0);
      }
      
      private function method_3299() : void
      {
         textField.textColor = textField.selectable ? uint(name_1139.name_2012) : uint(name_1139.const_1762);
      }
   }
}
