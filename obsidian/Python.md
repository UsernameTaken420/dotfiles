### `__init__.py`
Treat a folder as a package, usually an empty file
### unpacker
If I put `*` next to an iterator, such as an array `arr = [1, 2, 3]` it will unpack the elements
```python
arr = [1, 2, 3]
print(arr)  # -> [1, 2, 3]
print(*arr) # -> 1 2 3
```
In the same way, calling a function with a ton of args can be summed up using the unpacking operator
```python
def make_pizza(size, *toppings, **details): # usually used as *args and **kwargs
	#arguments and keyword arguments
	print(f"Ordered a {size} pizza with:")
	for topping in toppings:
		print(f"- {topping}")
	print("Details: ")
	for key, value in details.items():
		print(f"- {key}: {value}")

make_pizza("large", "cheese", "pepperoni", "bacon", delivery=True, top=0)
```

### lambda function
They HAVE to be single-line
```python
print((lambda x,y: x+y)(1,2)) # 3
```

### type annotation
```python
n: int = 100000000
print(f'{n:,}') # 100,000,000
var: str = 'var'
print(f'{var:=^20}') # prints var center-aligned filled by = signs
```

### decorators

### requirements.txt
Track required libraries
- `pip freeze > requirements.txt` to save current requirements
- `pip install -r requirements.txt` to install from file

---

#stub