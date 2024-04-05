package package_87
{
   import controls.Label;
   import controls.statassets.name_1154;
   
   public class name_1425 extends name_1154
   {
      
      private static const const_151:int = 3;
       
      
      private var label:Label;
      
      public function name_1425(param1:String, param2:int)
      {
         super();
         this.label = new Label();
         this.label.size = param2;
         this.label.text = param1;
         addChild(this.label);
         this.label.y = 3;
         height = 2 * 3 + this.label.height;
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this.label.x = int(width - this.label.width) >> 1;
      }
   }
}
