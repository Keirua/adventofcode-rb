module Utils
  # UnionFind, as described in https://www.cs.princeton.edu/~rs/AlgsDS07/01UnionFind.pdf
  # original implementation here https://algs4.cs.princeton.edu/15uf/UF.java.html
  class UnionFind
    attr_reader :nb_sets

    def initialize(n)
      @parents = (0..n).to_a
      @ranks = [0] * n
      @nb_sets = n
    end

    def root(i)
      while i != @parents[i]
        @parents[i] = @parents[@parents[i]]
        i = @parents[i]
      end
      i
    end

    def connected?(p, q)
      root(p) == root(q)
    end

    def unite(p, q)
      root_p = root(p)
      root_q = root(q)
      return if root_p == root_q

      make_root_of_smaller_rank_point_to_root_of_larger_rank(root_p, root_q)
    end

    private

    # make root of smaller rank point to root of larger rank
    def make_root_of_smaller_rank_point_to_root_of_larger_rank(root_p, root_q)
      if @ranks[root_p] < @ranks[root_q]
        @parents[root_p] = root_q
      elsif @ranks[root_p] > @ranks[root_q]
        @parents[root_q] = root_p
      else
        @parents[root_q] = root_p
        @ranks[root_p] += 1
      end
      @nb_sets -= 1
    end
  end
end
