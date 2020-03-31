public class Pdf extends Document implements Memory,File {
    @Override
    public String size() { 
	return "Size";
    }

    @Override
    public String content() {
	return "These are displayed";
    }

}
