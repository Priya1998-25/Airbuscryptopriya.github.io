<%@ page import="com.oreilly.servlet.MultipartRequest,java.sql.*,java.io.*" %> 
<%@ page import="javax.imageio.ImageIO,java.awt.Graphics,java.awt.Graphics2D,java.awt.image.BufferedImage"%>
<%@page errorPage="error.jsp"%> 
<%  
String path=application.getRealPath("/");
MultipartRequest m = new MultipartRequest(request, path+"/files",8200000);
String fname=m.getOriginalFileName("ofile");
String kfname=m.getOriginalFileName("keyfile");
String actionType=m.getParameter("fuse");

File ofile=new File(path+"/files/"+fname);
File keyfile=new File(path+"/files/"+kfname);
File fusedFile=new File(path+"/files/combined.jpg");
File defusedFile=new File(path+"/files/img1.jpg");

if(actionType.equals("Fuse"))
{
String st=fuse(ofile,keyfile,fusedFile);
out.println(st+"<br>");
out.println("<a href=download.jsp?imagename="+fusedFile.getName()+">download the fused image here</a>");
}
else if(actionType.equals("Defuse"))
{
String st=defuse(ofile,keyfile,defusedFile);
out.println(st+"<br>");
out.println("<a href=download.jsp?imagename="+defusedFile.getName()+">download the defused image here</a>");
}
%>
<br>

<%!public String fuse(File oFile,File keyFile,File fusedFile)
{

try
{
// load source images
BufferedImage image = ImageIO.read(oFile);
BufferedImage overlay = ImageIO.read(keyFile);

// create the new image, canvas size is the max. of both image sizes
int w1 = image.getWidth();
int h1=image.getHeight();
int h=image.getHeight();//Math.max(image.getHeight(), overlay.getHeight());
int w2 = overlay.getWidth();//Math.max(image.getHeight(), overlay.getHeight());
int h2=overlay.getHeight();
//int h2=overlay.getHeight();
BufferedImage combined = new BufferedImage(w1+w2, h, image.getType());

// paint both images, preserving the alpha channels
Graphics2D g = combined.createGraphics();
//g.drawImage(image, 0, 0, null);//0 0 are co-ordinates
//g.drawImage(overlay, w1, 0, null);//w1 0 are co-ordinates

int dx1,dy1,dx2,dy2;
dx1=0;dy1=0;dx2=1;dy2=1;
int sx1,sy1,sx2,sy2;
sx1=0;sy1=0;sx2=1;sy2=1;
int dw=w1+w2;
int dh=h;

int imageVPCounter=1;
int keyImageVPCounter=1;

for(int i=1;i<=dh;i++)
{
dx1=0;dx2=1;sx1=0;sx2=1;
int imageHPCounter=1; //HP-horizontal pixel,VP-vertical pixel
int keyImageHPCounter=1;
for(int j=1;j<=dw;j++)
{
		if(imageVPCounter<=h1 || imageHPCounter<=w1)
		{
		g.drawImage(image,dx1,dy1,dx2,dy2,sx1,sy1,sx2,sy2,null);
	dx1+=dx2;
	dx2+=1;
	imageHPCounter++;
		}

	if(keyImageVPCounter<=h2 || keyImageHPCounter<=w2)
	{
		g.drawImage(overlay,dx1,dy1,dx2,dy2,sx1,sy1,sx2,sy2,null);
		dx1+=dx2;
		dx2+=1;
		sx1+=sx2;
		sx2+=1;
		keyImageHPCounter++;
	}

	
}
imageVPCounter++;
keyImageVPCounter++;
dy1+=1;dy2+=1;sy1+=1;sy2+=1;
//System.out.println(dy1+" "+dy2+" "+sy1+" "+sy2);
}

// Save as new image
ImageIO.write(combined, "jpeg", fusedFile);
return "Successfully combined";
}
catch(Exception e)
{
	return e.toString();
}
}
%>

<%!
public String defuse(File oFile,File keyFile,File defusedFile)
{
     try
     {

        BufferedImage image = ImageIO.read(oFile); //reading the image file  
        BufferedImage keyImage= ImageIO.read(keyFile);
  
        int kwidth=keyImage.getWidth();
        int chunkWidth = image.getWidth(); // determines the chunk width and height  
        int chunkHeight = image.getHeight();  
        
        
                //Initialize the image array with image chunks  
              BufferedImage img1 = new BufferedImage(chunkWidth-kwidth, chunkHeight, image.getType());  
              //BufferedImage img2 = new BufferedImage(image.getWidth()-chunkWidth,chunkHeight, image.getType());  
                // draws the image chunk  
                Graphics2D gr = img1.createGraphics();  

int dx1,dy1,dx2,dy2;
dx1=0;dy1=0;dx2=1;dy2=1;
int sx1,sy1,sx2,sy2;
sx1=0;sy1=0;sx2=1;sy2=1;
int dw=chunkWidth;
int dh=chunkHeight;

for(int i=1;i<=dh;i++)
{
dx1=0;dx2=1;sx1=0;sx2=1;

for(int j=1;j<=dw;j++)
{

		gr.drawImage(image,dx1,dy1,dx2,dy2,sx1,sy1,sx2,sy2,null);
	dx1+=dx2;
	dx2+=1;

		sx1+=sx2;
		sx2+=1;
		sx1+=sx2;
		sx2+=1;

	
}
dy1+=1;dy2+=1;sy1+=1;sy2+=1;
}
				
				
                //gr.drawImage(image, 0, 0, chunkWidth-kwidth, chunkHeight, 0, 0, chunkWidth-kwidth, chunkHeight, null);  
                gr.dispose();  
                
                /*gr = img2.createGraphics();  
                gr.drawImage(image, 0, 0, img2.getWidth(), img2.getHeight(), img1.getWidth(), 0, image.getWidth(), image.getHeight(), null);  
                gr.dispose();  */

        
  
        //writing mini images into image files  
        
            ImageIO.write(img1, "jpeg", defusedFile);    
        
        return "Defusion Done. image created";
     }
     catch(Exception e)
     {
         return e.toString();
     }
}
%>