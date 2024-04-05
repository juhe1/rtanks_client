package controls.buttons
{
   public class class_163 extends ButtonBase
   {
       
      
      protected var var_1791:name_2257;
      
      protected var var_1786:name_2257;
      
      protected var var_1785:name_2257;
      
      protected var var_1787:name_2257;
      
      public function class_163(param1:name_2258)
      {
         this.var_1791 = new name_2257(param1.up);
         this.var_1786 = new name_2257(param1.over);
         this.var_1785 = new name_2257(param1.down);
         this.var_1787 = new name_2257(param1.disabled);
         super(this.var_1791,this.var_1786,this.var_1785,this.var_1787);
      }
      
      public function name_1146(param1:name_2258) : void
      {
         this.var_1791.name_1146(param1.up);
         this.var_1786.name_1146(param1.over);
         this.var_1785.name_1146(param1.down);
         this.var_1787.name_1146(param1.disabled);
      }
   }
}
