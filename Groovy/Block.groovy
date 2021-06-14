// Leaf
class Block extends BaseComponent {

    String pinyin
    String symbol

    Block(String name, String pinyin, String symbol) {
        this.name = name
        this.pinyin = pinyin
        this.symbol = symbol
    }

    @Override
    String getField(BlockType blockType) {
        switch (blockType) {
            case BlockType.NAME:
                return this.name
            case BlockType.PINYIN:
                return this.pinyin
            case BlockType.SYMBOL:
                return this.symbol
        }
    }

    @Override
    String toString() {
        return "• ${getStringRepresentation()}"
    }
}
