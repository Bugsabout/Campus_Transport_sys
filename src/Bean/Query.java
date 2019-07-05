package Bean;
import java.util.ArrayList;//List�ӿ�ʵ�����ɱ�����,VectorҪ��
import java.util.LinkedList;//����
import java.util.List;//�ӿ�
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
        if(origin==null)return;  //û���������
        List<Vertex> queue=new LinkedList<Vertex>();  
        origin.setVisited(true);  //��������㣬�������������Ϊ���ʹ���״̬��
        queue.add(origin);  
        breadthFirstResult.add(origin);  
        Vertex curVertex=null;  
        while(!queue.isEmpty()){  
            curVertex=queue.remove(0);  //���ڵĶ���
            while(curVertex.getFirstUnvisitedNeighbor()!=null){  //�������������û���ھӣ��о�next�����뵽queue�������Ա���ʡ�
                Vertex tmpVertex=curVertex.getFirstUnvisitedNeighbor();  
                tmpVertex.setVisited(true);  
                queue.add(tmpVertex);  
                breadthFirstResult.add(tmpVertex);  
            }  
              
        }  
        printVertexList(breadthFirstResult);   //������ȱ����Ľ��
}  
      
    
    //��������㷨����û�м���Ȩ�ظ��û�й��������  
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
                tmpVertex.setCost(tmpCost);   //Ȩ�����⣬���п���
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
        int endIndex=vertices.indexOf(new Vertex(endLabel));  //��Ķ�������Vertices����2�������λ�ã��Ա������ϰ
        Vertex beginVertex=vertices.get(beginIndex);  
        Vertex endVertex=vertices.get(endIndex);  
        boolean result=beginVertex.connect(endVertex,weight);  
        edgeCount++;  
        return result;  
    } 
    
    public boolean addEdge(int beginLabel,int endLabel){  
        return addEdge(beginLabel,endLabel,0);    //��endLabel��stid������ӵ�beginLabel�����edge�����У��γ���ϵ��Ҳ���Ƕ���֮���·��
    }//y  
    
    public boolean addVertex(int label){  
        boolean result=false;  
        Vertex newVertex=new Vertex(label);  //labelʵ����ʵ���е�stid������stid����Ӷ��㣬ʵ��stinfo����վ��Ķ���ͼ
        if(!vertices.contains(newVertex)){  
            vertices.add(newVertex);//������ظ���stid 
            result=true;  
        }  
        return result;  
    }//y 
    
    public void printVertexList(List<Vertex> list){  
        for(int i=0,len=list.size();i<len;i++){  
            Vertex vertex=list.get(i);  
            System.out.print(vertex.getLabel()+" ");  //���Vertex�������
        }  
        System.out.println();  
    }//y  
      
    public void resetVertices(){  
        for(int i=0,len=vertices.size();i<len;i++){  
            Vertex vertex=vertices.get(i);  
            vertex.setPreviousVertex(null);  
            vertex.setVisited(false);  
            vertex.setCost(0);  //����vertices����
        }  
    } //y 
      
    public Vertex getVertexByInt(int target){  
        Vertex vertex=null;  
        for(int i=0,len=vertices.size();i<len;i++){  
            vertex=vertices.get(i);  
            int xx=vertex.getLabel();  
            if(xx==target){  
                return vertex;              //ͨ��int���͵�label(stid)ƥ��vertex
            }  
        }  
        return vertex;  
    }//y
      
    public Query(){  
        vertices=new ArrayList<Vertex>();  
        edgeCount=0;  

        breadthFirstResult=new ArrayList<Vertex>();  
    }//���캯������ʼ��Query��  
  
      
      
    public static void main(String[] args) {  
          
        Query graph=createGapth();  //��������ṹ
        graph.resetVertices();  
        graph.setBID(1601);
        graph.setEID(3710);
        graph.breadthFirstVisit();//breadthFirstVisit,start with ,ֻ�Ǳ��� 
        //shortest path  
        Stack<Integer> pathStack=new Stack<Integer>();  
        //
        double pathLength=graph.getShortestPath(pathStack);			//������·������
        while(!pathStack.isEmpty()){  
            int a=pathStack.pop();  
            System.out.print(a+"��");  
        }  
          
        //BasicGraphInterface<String> airMap=new UndirectedGraph<String>();  
        //airMap.  
          
    }  
      
    public static Query createGapth(){     //���������Ҫ���ԭ��
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
    		System.out.print("��������ͼʧ�ܣ�");
    	}											//�����������vertex���㣬��û��������
    	
    	
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
    			System.out.print("��ѯ���г���ʧ�ܣ�");
    		}								//�������ǻ�ȡ���г��ӵĳ��Ų��Ҵ浽bn������
    	
    	
    	
    	//����û���⣬���������ǲ�����ˣ�������ν�վ��Ĺ�ϵ��ӽ�ȥ��
    	try {
    		for(int h=0;h<i;h++)   //���i�����ĸ���վ����Ϣ
    		{
      			int j=0;
      			int k=0;
      			int[] arr=new int[50];//ÿ��һ������һ���µ���������
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
    		System.out.print("���������������վ��ı�ʧ�ܣ�");
    	}
    	
    	
    	
    	
		return graph;  
}  
  
    
  
class Vertex{  
    private int label;  //��StID��Ϊ����ı�־
    private List<Edge> edgeList;  //����������ڵĶ���
    private boolean isVisited;  
    private Vertex previousVertex;//use it in the method-'getShortestPath()'  
    private double cost;//the cost from beginning to this vertex����weight���
      
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
    }  //y �ж��ǲ���һ��
    
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
        //is "A",the "endVertex" is "B" �����A��B
        private Vertex endVertex;  //y
        private int[] BusNum=new int[5];    					//ÿ���߶�����뾭���ñߵĳ���
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
