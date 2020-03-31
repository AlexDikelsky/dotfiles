public abstract class Document implements File,Memory {
    String name;

    public String filename()       { return name; }
    public String size() { return "3"; }

    public void content() { System.out.println("These are contents"); }
}


