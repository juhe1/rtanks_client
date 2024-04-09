package alternativa.tanks.gui.settings.controls
{
   import alternativa.tanks.service.settings.name_1086;
   import controls.checkbox.CheckBoxBase;
   
   public class name_2109 extends CheckBoxBase implements name_2108
   {
       
      
      private var var_1753:name_1086;
      
      public function name_2109(param1:name_1086, param2:String)
      {
         super();
         this.var_1753 = param1;
         this.label = param2;
      }
      
      public function name_2110() : Object
      {
         return checked;
      }
      
      public function name_1383() : name_1086
      {
         return this.var_1753;
      }
   }
}
