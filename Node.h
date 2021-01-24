#pragma once
template<class T>
struct Node
{
	T Value;
	Node<T> *RightChild;
	Node<T>*LeftChild;
	Node()
	{
		Value = 0;
		RightChild = nullptr;
		LeftChild = nullptr;
	}
};