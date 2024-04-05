package controls.lifeindicator
{
   import controls.resultassets.name_2332;
   
   public class name_1121 extends name_2332
   {
       
      
      private var var_1897:LineCharge;
      
      private var var_1898:LineLife;
      
      private var var_1899:Number = 1;
      
      private var var_1900:Number = 1;
      
      public function name_1121()
      {
         super();
         this.var_1897 = new LineCharge();
         this.var_1897.x = 6;
         this.var_1897.y = 22;
         addChild(this.var_1897);
         this.var_1898 = new LineLife();
         addChild(this.var_1898);
         this.var_1898.x = 6;
         this.var_1898.y = 6;
      }
      
      override public function draw() : void
      {
         super.draw();
         this.charge = this.var_1899;
         this.name_1114 = this.var_1900;
      }
      
      public function set charge(param1:Number) : void
      {
         if(this.var_1899 == param1)
         {
            return;
         }
         this.var_1899 = param1;
         this.var_1897.name_1152((_width - 12) * this.var_1899);
      }
      
      public function set name_1114(param1:Number) : void
      {
         if(this.var_1900 == param1)
         {
            return;
         }
         this.var_1900 = param1;
         this.var_1898.name_1152((_width - 12) * this.var_1900);
      }
   }
}
