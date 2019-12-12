function rnd = normrnd (mu, sigma, varargin)

  if (nargin < 2)
    print_usage ();
  endif

  if (! isscalar (mu) || ! isscalar (sigma))
    [retval, mu, sigma] = common_size (mu, sigma);
    if (retval > 0)
      error ("normrnd: MU and SIGMA must be of common size or scalars");
    endif
  endif

  if (iscomplex (mu) || iscomplex (sigma))
    error ("normrnd: MU and SIGMA must not be complex");
  endif

  if (nargin == 2)
    sz = size (mu);
  elseif (nargin == 3)
    if (isscalar (varargin{1}) && varargin{1} >= 0)
      sz = [varargin{1}, varargin{1}];
    elseif (isrow (varargin{1}) && all (varargin{1} >= 0))
      sz = varargin{1};
    else
      error ("normrnd: dimension vector must be row vector of non-negative integers");
    endif
  elseif (nargin > 3)
    if (any (cellfun (@(x) (! isscalar (x) || x < 0), varargin)))
      error ("normrnd: dimensions must be non-negative integers");
    endif
    sz = [varargin{:}];
  endif

  if (! isscalar (mu) && ! isequal (size (mu), sz))
    error ("normrnd: MU and SIGMA must be scalar or of size SZ");
  endif

  if (isa (mu, "single") || isa (sigma, "single"))
    cls = "single";
  else
    cls = "double";
  endif

  if (isscalar (mu) && isscalar (sigma))
    if (isfinite (mu) && (sigma >= 0) && (sigma < Inf))
      rnd = mu + sigma * randn (sz, cls);
    else
      rnd = NaN (sz, cls);
    endif
  else
    rnd = mu + sigma .* randn (sz, cls);
    k = ! isfinite (mu) | !(sigma >= 0) | !(sigma < Inf);
    rnd(k) = NaN;
  endif

endfunction
