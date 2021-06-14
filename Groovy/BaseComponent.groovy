abstract class BaseComponent implements Component {
    String name

    @Override
    String getName() {
        return name
    }

    @Override
    void printName() {
        println("\t• ${getName()}")
    }

    @Override
    void printField(BlockType blockType) {
        println("\t• ${getField(blockType)}")
    }

    @Override
    String getStringRepresentation() {
        return "$name (${getField(BlockType.PINYIN)}, ${getField(BlockType.SYMBOL)})"
    }

    boolean equals(o) {
        if (this.is(o)) return true
        if (getClass() != o.class) return false

        BaseComponent that = (BaseComponent) o

        if (name != that.name) return false

        return true
    }

    int hashCode() {
        return name.hashCode()
    }
}
