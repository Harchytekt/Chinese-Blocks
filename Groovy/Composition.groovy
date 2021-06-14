// Composite
class Composition extends BaseComponent {

    List<Component> componentList = new ArrayList<>()
    boolean isComplete = false

    Composition(String name) {
        this.name = name
    }

    void setCompleteStringRepresentation() {
        this.isComplete = true
    }

    void unsetCompleteStringRepresentation() {
        this.isComplete = false
    }

    @Override
    String getField(BlockType blockType) {
        String res = ""
        componentList.each { block ->
            switch (blockType) {
                case [BlockType.NAME, BlockType.PINYIN]:
                    res += "${block.getField(blockType)} "
                    break
                case BlockType.SYMBOL:
                    res += "${block.getField(blockType)}"
            }
        }


        if (blockType == BlockType.PINYIN) {
            res = res.toLowerCase ( ).capitalize ( )
        }
        if (blockType in [BlockType.PINYIN, BlockType.NAME]) {
            res = res[0..-2]
        }
        return res
    }

    void addComponent(Component component) {
        componentList.add(component)
    }

    void removeComponent(Component component) {
        componentList.remove(component)
    }

    private String tree(Component component, int depth, boolean isComplete) {
        String res = "${("\t" * depth)}• ${isComplete ? component.getStringRepresentation() : component.getName()}"

        if (component instanceof Composition) {
            depth += 1
            component.componentList.each {
                res += "\n${tree(it, depth, isComplete)}"
            }
        }

        return res
    }

    @Override
    String toString() {
        int depth = 0
        String res = "${("\t" * depth)}• ${getStringRepresentation()}"

        depth += 1
        componentList.each {
            res += "\n${tree(it, depth, isComplete)}"
        }

        return res
    }
}
