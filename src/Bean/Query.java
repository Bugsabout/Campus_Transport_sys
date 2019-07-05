package Bean;
import java.util.ArrayList;//List接口实例，可变数组,Vector要用
import java.util.LinkedList;//链表
import java.util.List;//接口
import java.util.Stack;
import Bean.DBBean;
import java.sql.*;

public class Query {
	private int Begin;
	private int End;
	private List<Vertex> vertices;  
    private int edgeCount;  
    private List<Vertex> breadthFirstResult;
    public void setBID(int a) {
    	Begin=a;
    }
    public int getBID() {
    	return Begin;
    }
    public void setEID(int b) {
    	End=b;
    }
    public int getEID() {
    	return End;
    }
      
public void breadthFirstVisit(){  
          
        Vertex origin=this.getVertexByInt(Begin);  
        if(origin==null)return;  //没有这个顶点
        List<Vertex> queue=new LinkedList<Vertex>();  
        origin.setVisited(true);  //有这个顶点，就设置这个顶点为访问过的状态了
        queue.add(origin);  
        breadthFirstResult.add(origin);  
        Vertex curVertex=null;  
        while(!queue.isEmpty()){  
            curVertex=queue.remove(0);  //现在的顶点
            while(curVertex.getFirstUnvisitedNeighbor()!=null){  //看看这个顶点有没有邻居，有就next，加入到queue队列中以便访问。
                Vertex tmpVertex=curVertex.getFirstUnvisitedNeighbor();  
                tmpVertex.setVisited(true);  
                queue.add(tmpVertex);  
                breadthFirstResult.add(tmpVertex);  
            }  
              
        }  
        printVertexList(breadthFirstResult);   //广度优先遍历的结果
}  
      
    
    //广度优先算法，我没有加入权重概念，没有公里的问题  
    public double getShortestPath(Stack<Integer> stack){  
        resetVertices();  
        Vertex begin=this.getVertexByInt(Begin);  
        Vertex end=this.getVertexByInt(End);  
        begin.setVisited(true);  
        List<Vertex> queue=new LinkedList<Vertex>();  
        queue.add(begin);  
        boolean done=false;  
        while(!done&&!queue.isEmpty()){  
            Vertex curVertex=queue.remove(0);  
            while(!done&&curVertex.getFirstUnvisitedNeighbor()!=null){  
                Vertex tmpVertex=curVertex.getFirstUnvisitedNeighbor();  
                tmpVertex.setVisited(true);  
                double  tmpCost=curVertex.getCost()+1;  
                tmpVertex.setPreviousVertex(curVertex);  
                tmpVertex.setCost(tmpCost);   //权重问题，可有可无
                queue.add(tmpVertex);  
                if(tmpVertex.equals(end)){  
                    done=true;  
                }  
            }  
        }  
        double pathLength=end.getCost();  
        //find the path.traverse back from end  
        while(end!=null){  
            stack.push(end.getLabel());  
            end=end.getPreviousVertex();  
        }  
        return pathLength;  
    }  
      
    public boolean addEdge(int beginLabel,int endLabel,double weight){  
        int beginIndex=vertices.indexOf(new Vertex(beginLabel));  
        int endIndex=vertices.indexOf(new Vertex(endLabel));  //求的顶点数组Vertices中这2个顶点的位置，以便添加练习
        Vertex beginVertex=vertices.get(beginIndex);  
        Vertex endVertex=vertices.get(endIndex);  
        boolean result=beginVertex.connect(endVertex,weight);  
        edgeCount++;  
        return result;  
    } 
    
    public boolean addEdge(int beginLabel,int endLabel){  
        return addEdge(beginLabel,endLabel,0);    //将endLabel的stid顶点添加到beginLabel顶点的edge数组中，形成联系，也就是顶点之间的路线
    }//y  
    
    public boolean addVertex(int label){  
        boolean result=false;  
        Vertex newVertex=new Vertex(label);  //label实际是实例中的stid，根据stid来添加顶点，实现stinfo所有站点的顶点图
        if(!vertices.contains(newVertex)){  
            vertices.add(newVertex);//不添加重复的stid 
            result=true;  
        }  
        return result;  
    }//y 
    
    public void printVertexList(List<Vertex> list){  
        for(int i=0,len=list.size();i<len;i++){  
            Vertex vertex=list.get(i);  
            System.out.print(vertex.getLabel()+" ");  //输出Vertex类的数组
        }  
        System.out.println();  
    }//y  
      
    public void resetVertices(){  
        for(int i=0,len=vertices.size();i<len;i++){  
            Vertex vertex=vertices.get(i);  
            vertex.setPreviousVertex(null);  
            vertex.setVisited(false);  
            vertex.setCost(0);  //重置vertices数组
        }  
    } //y 
      
    public Vertex getVertexByInt(int target){  
        Vertex vertex=null;  
        for(int i=0,len=vertices.size();i<len;i++){  
            vertex=vertices.get(i);  
            int xx=vertex.getLabel();  
            if(xx==target){  
                return vertex;              //通过int类型的label(stid)匹配vertex
            }  
        }  
        return vertex;  
    }//y
      
    public Query(){  
        vertices=new ArrayList<Vertex>();  
        edgeCount=0;  

        breadthFirstResult=new ArrayList<Vertex>();  
    }//构造函数，初始化Query类  
  
      
      
    public static void main(String[] args) {  
          
        Query graph=createGapth();  //建立顶点结构
        graph.resetVertices();  
        graph.setBID(1601);
        graph.setEID(3710);
        graph.breadthFirstVisit();//breadthFirstVisit,start with ,只是遍历 
        //shortest path  
        Stack<Integer> pathStack=new Stack<Integer>();  
        //
        double pathLength=graph.getShortestPath(pathStack);			//不考虑路径长度
        while(!pathStack.isEmpty()){  
            int a=pathStack.pop();  
            System.out.print(a+"→");  
        }  
          
        //BasicGraphInterface<String> airMap=new UndirectedGraph<String>();  
        //airMap.  
          
    }  
      
    public static Query createGapth(){     //这里就是主要错的原因
		Query graph=new Query();
		DBBean db=new DBBean();
		int[] bn=new int[20];
		int i=0;

    	try {
    		String sql="select StID from stinfo";
    		ResultSet rs=db.executeQuery(sql);
    		while(rs.next())
    		{
    			graph.addVertex(rs.getInt(1));
    		}

    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    		System.out.print("创建顶点图失败！");
    	}											//到这里是添加vertex顶点，还没出现问题
    	
    	
    	try {
    			String sql2="SELECT * from businfo";
    				ResultSet rs2=db.executeQuery(sql2);
    					while(rs2.next()) {
    							bn[i]=rs2.getInt(1);
    							i++;
    						}
    		}
    	catch(SQLException ex){
    			ex.printStackTrace();
    			System.out.print("查询所有车号失败！");
    		}								//到这里是获取所有车子的车号并且存到bn数组中
    	
    	
    	
    	//上面没问题，现在数据是查出来了，但是如何将站点的关系添加进去。
    	try {
    		for(int h=0;h<i;h++)   //查出i辆车的各个站点信息
    		{
      			int j=0;
      			int k=0;
      			int[] arr=new int[50];//每换一辆车用一个新的数组来存
    			String sql3="select StID from busst where BusNum="+bn[h]+" Order by StOrder";
    			ResultSet rs3=db.executeQuery(sql3);
    			while(rs3.next())
    			{	
    				arr[j]=rs3.getInt(1);
    				j++;
    			}
    			for(k=0;k<j-1;k++)
    			{
    				int m=0,n=0;
    				m=arr[k];
    				n=arr[k+1];	
    				graph.addEdge(arr[k], arr[k+1]);
    				graph.addEdge(arr[k+1], arr[k]);
    			}
    		}
    		
    	}catch(SQLException e1) {
    		e1.printStackTrace();
    		System.out.print("导入各个车号所有站点的边失败！");
    	}
    	
    	
    	
    	
		return graph;  
}  
  
    
  
class Vertex{  
    private int label;  //用StID作为顶点的标志
    private List<Edge> edgeList;  //放入和他相邻的顶点
    private boolean isVisited;  
    private Vertex previousVertex;//use it in the method-'getShortestPath()'  
    private double cost;//the cost from beginning to this vertex，用weight相加
      
    public Vertex(int label){  
        this.label=label;   
        edgeList=new ArrayList<Edge>();  
        isVisited=false;  
        previousVertex=null;  
        cost=0;  
    }  //y
    
    public boolean isVisited(){  
        return isVisited;  
    }  //y
    
    public void visit(){  
        System.out.println(this.label);  
        this.isVisited=true;  
    }  //y
      
    public void setPreviousVertex(Vertex vertex){  
        this.previousVertex=vertex;  
    }  //y
    
    public void setVisited(Boolean isVisited){  
        this.isVisited=isVisited;  
    }//y  
    
    public void setCost(double cost){  
        this.cost=cost;  
    }//y
    
    public Vertex getFirstNeighbor(){  
        Vertex neighbor=this.edgeList.get(0).endVertex;  
        return neighbor;  
    }
    
    public int getLabel(){  
        return this.label;  
    }//y
      
    public double getCost(){  
        return this.cost;  
    }//y
    
    public Vertex getPreviousVertex(){  
        return this.previousVertex;  
    }//y
    
    public Vertex getFirstUnvisitedNeighbor(){  
        Vertex unVisitedNeighbor=null;  
        for(int i=0,len=edgeList.size();i<len;i++){  
            Vertex vertex=edgeList.get(i).endVertex;  
            if(!vertex.isVisited){  
                unVisitedNeighbor=vertex;  
                break;  
            }  
        }  
        return unVisitedNeighbor;  
    }//y
    
    public boolean equals(Object object){  
        boolean result=false;  
        if(this==object)return true;  
        if(object instanceof Vertex){  
            Vertex otherVertex=(Vertex)object;  
            result=this.label==otherVertex.label;  
        }  
        return result;  
    }  //y 判断是不是一类
    
    public boolean connect(Vertex endVertex,double weight){  
          
        boolean result=false;//result=true if successful  
          
        if(!this.equals(endVertex)){//connections should occur in different Vertices  
            boolean isDuplicateEdge=false;  
            List<Edge> edgeList=this.edgeList;  
            if(edgeList.contains(endVertex)){  
                isDuplicateEdge=true;  
            }  
            if(!isDuplicateEdge){  
                //endVertex.previousVertex=this;  
                edgeList.add(new Edge(endVertex,weight));  
                result=true;  
            }  
        }  
              
        return result;  
    }//y  
      
    public boolean hasNeighbor(){  
        return !edgeList.isEmpty();  
    } //y 
}   
    
    
    
    protected  class Edge{  
        //A-->B,then the "outerClass" which invokes the method "getEndVertex"   
        //is "A",the "endVertex" is "B" 有向边A→B
        private Vertex endVertex;  //y
        private int[] BusNum=new int[5];    					//每条边都会加入经过该边的车号
        private double weight;  //y
          
        protected Edge(Vertex endVertex,double weight){  
            this.endVertex=endVertex;  
            this.weight=weight;  
        }  //y
        protected Vertex getEndVertex(){  
            return endVertex;  
        }  //y
        protected double getWeight(){  
            return weight;  
        }  //y
        protected int getBusNum(int a) {
        	return BusNum[a];
        }
    }  
}
