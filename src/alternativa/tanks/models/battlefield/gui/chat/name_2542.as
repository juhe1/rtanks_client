package alternativa.tanks.models.battlefield.gui.chat
{
   import controls.Label;
   import package_427.name_2537;
   
   public class name_2542 extends name_2537
   {
       
      
      private var var_633:Label;
      
      public function name_2542(param1:int, param2:String)
      {
         this.var_633 = new Label();
         super();
         this.var_633.color = 8454016;
         this.var_633.multiline = true;
         this.var_633.wordWrap = true;
         this.var_633.mouseEnabled = false;
         this.var_633.thickness = 150;
         this.var_633.sharpness = 200;
         this.var_633.text = param2;
         var_2577.addChild(this.var_633);
         this.width = param1;
      }
      
      override public function set width(param1:Number) : void
      {
         this.var_633.width = int(param1) - 5;
      }
   }
}
