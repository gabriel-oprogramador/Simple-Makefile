CC = g++
FLAGS = -g -Wall
INCLUDES = -Isource/include

TARGET = $(notdir $(CURDIR))
SRC_DIR = source/
INCLUDES_DIR = $(SRC_DIR)include
BUILD_DIR = build/
OBJ_DIR = $(BUILD_DIR)obj/
SRC = $(wildcard $(SRC_DIR)*.cpp) $(wildcard $(SRC_DIR)*/*.cpp) $(wildcard $(SRC_DIR)*/*/*.cpp) $(wildcard $(SRC_DIR)*/*/*/*.cpp)
OBJ = $(addprefix $(OBJ_DIR), $(notdir $(SRC:.cpp=.o)))

ifeq ($(OS), Windows_NT)
EXTENCION = .exe
LIBS_DIR =
LIBS = 
else
EXTENCION = 
LIBS_DIR =
LIBS = 
endif

all: install $(TARGET)

install:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(OBJ_DIR)
	@mkdir -p $(INCLUDES_DIR)

run: install $(TARGET)
	@echo "Running -> $(BUILD_DIR)$(TARGET)$(EXTENCION)" 
	$(BUILD_DIR)$(TARGET)$(EXTENCION)

clean:
	@echo "Cleaning..."
	@rm -f -r $(BUILD_DIR)

$(TARGET): $(OBJ)
	@echo "Linking -> $(BUILD_DIR)$(TARGET)$(EXTENCION)"
	@$(CC) $(OBJ) $(FLAGS) $(INCLUDES) $(LIBS) $(LIBS_DIR) -o $(BUILD_DIR)$(TARGET)$(EXTENCION)

# Level 1 source
$(OBJ_DIR)%.o: $(SRC_DIR)%.cpp
	@echo "Compiling:$<..."
	@$(CC) $< $(FLAGS) $(INCLUDES) -c -o $@

# Level 2
$(OBJ_DIR)%.o: $(SRC_DIR)*/%.cpp
	@echo "Compiling:$<..."
	@$(CC) $< $(FLAGS) $(INCLUDES) -c -o $@

# Level 3
$(OBJ_DIR)%.o: $(SRC_DIR)*/*/%.cpp
	@echo "Compiling:$<..."
	@$(CC) $< $(FLAGS) $(INCLUDES) -c -o $@

# Level 4
$(OBJ_DIR)%.o: $(SRC_DIR)*/*/*/%.cpp
	@echo "Compiling:$<..."
	@$(CC) $< $(FLAGS) $(INCLUDES) -c -o $@