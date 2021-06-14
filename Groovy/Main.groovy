class Main {
    static void main(String[] args) {
        Block fire = new Block("Feu", "Huǒ", "火")
        Block mountain = new Block("Montagne", "Shān", "山")
        Composition volcano = new Composition("Volcan")
        volcano.addComponent(fire)
        volcano.addComponent(mountain)

        Composition crater = new Composition("Cratère")
        crater.addComponent(volcano)
        crater.addComponent(new Block("Bouche", "Kǒu", "口"))

        Composition caldera = new Composition("Caldeira")
        caldera.addComponent(new Block("Cassé", "Pò", "破"))
        caldera.addComponent(crater)

        caldera.setCompleteStringRepresentation()
        println caldera
    }
}
