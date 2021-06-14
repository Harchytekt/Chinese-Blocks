interface Component {

    String getName()
    String getField(BlockType blockType)
    String getStringRepresentation()

    void printName()
    void printField(BlockType blockType)

    boolean equals(o)
    int hashCode()

    String toString()
}