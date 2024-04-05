package package_351
{
   public class PropGroup
   {
       
      
      public var name:String;
      
      public var props:Vector.<PropData>;
      
      public var name_1681:Vector.<PropGroup>;
      
      public function PropGroup(param1:String)
      {
         super();
         this.name = param1;
      }
      
      public function method_2465(param1:String) : PropData
      {
         var _loc2_:PropData = null;
         if(this.props == null)
         {
            return null;
         }
         for each(_loc2_ in this.props)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function method_2464(param1:String) : PropGroup
      {
         var _loc2_:PropGroup = null;
         if(this.name_1681 == null)
         {
            return null;
         }
         for each(_loc2_ in this.name_1681)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function name_2684(param1:PropData) : void
      {
         if(this.props == null)
         {
            this.props = new Vector.<PropData>();
         }
         this.props.push(param1);
      }
      
      public function name_2683(param1:PropGroup) : void
      {
         if(this.name_1681 == null)
         {
            this.name_1681 = new Vector.<PropGroup>();
         }
         this.name_1681.push(param1);
      }
      
      public function method_2463() : void
      {
         var _loc1_:PropGroup = null;
         var _loc2_:PropData = null;
         if(this.name_1681 != null)
         {
            for each(_loc1_ in this.name_1681)
            {
               _loc1_.method_2463();
            }
         }
         if(this.props != null)
         {
            for each(_loc2_ in this.props)
            {
               _loc2_.method_2461();
            }
         }
      }
   }
}
