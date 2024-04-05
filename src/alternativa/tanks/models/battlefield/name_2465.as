package alternativa.tanks.models.battlefield
{
   public class name_2465 implements name_1384
   {
       
      
      private var var_3095:RenderGroup;
      
      private var renderer:name_1229;
      
      public function name_2465(param1:RenderGroup, param2:name_1229)
      {
         super();
         this.var_3095 = param1;
         this.renderer = param2;
      }
      
      public function execute() : void
      {
         this.var_3095.name_755(this.renderer);
      }
   }
}
