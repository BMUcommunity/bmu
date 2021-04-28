// SPDX-License-Identifier: MIT
// File: @openzeppelin/contracts/token/ERC20/IERC20.sol


pragma solidity >=0.6.0 <0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: @openzeppelin/contracts/math/SafeMath.sol


pragma solidity >=0.6.0 <0.8.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        uint256 c = a + b;
        if (c < a) return (false, 0);
        return (true, c);
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        if (b > a) return (false, 0);
        return (true, a - b);
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) return (true, 0);
        uint256 c = a * b;
        if (c / a != b) return (false, 0);
        return (true, c);
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        if (b == 0) return (false, 0);
        return (true, a / b);
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        if (b == 0) return (false, 0);
        return (true, a % b);
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) return 0;
        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "SafeMath: division by zero");
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "SafeMath: modulo by zero");
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        return a - b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryDiv}.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts/utils/Address.sol


pragma solidity >=0.6.2 <0.8.0;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: value }(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(bool success, bytes memory returndata, string memory errorMessage) private pure returns(bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

// File: @openzeppelin/contracts/token/ERC20/SafeERC20.sol


pragma solidity >=0.6.0 <0.8.0;




/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: @openzeppelin/contracts/utils/Context.sol


pragma solidity >=0.6.0 <0.8.0;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/token/ERC20/ERC20.sol


pragma solidity >=0.6.0 <0.8.0;




/**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 * For a generic mechanism see {ERC20PresetMinterPauser}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * We have followed general OpenZeppelin guidelines: functions revert instead
 * of returning `false` on failure. This behavior is nonetheless conventional
 * and does not conflict with the expectations of ERC20 applications.
 *
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 *
 * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See {IERC20-approve}.
 */
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;
    uint8 private _decimals;

    /**
     * @dev Sets the values for {name} and {symbol}, initializes {decimals} with
     * a default value of 18.
     *
     * To select a different value for {decimals}, use {_setupDecimals}.
     *
     * All three of these values are immutable: they can only be set once during
     * construction.
     */
    constructor (string memory name_, string memory symbol_) public {
        _name = name_;
        _symbol = symbol_;
        _decimals = 18;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless {_setupDecimals} is
     * called.
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual returns (uint8) {
        return _decimals;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * Requirements:
     *
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    /**
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     *
     * This is internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Sets {decimals} to a value other than the default one of 18.
     *
     * WARNING: This function should only be called from the constructor. Most
     * applications that interact with token contracts will not expect
     * {decimals} to ever change, and may work incorrectly if it does.
     */
    function _setupDecimals(uint8 decimals_) internal virtual {
        _decimals = decimals_;
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be to transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual { }
}

// File: @openzeppelin/contracts/access/Ownable.sol


pragma solidity >=0.6.0 <0.8.0;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () internal {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: contracts/biz/Auth.sol

pragma solidity 0.6.9;


abstract contract Auth is Ownable {
    mapping(address => bool) private authInfo;

    modifier auth {
        require(authInfo[msg.sender] || msg.sender == owner(), "no permission");
        _;
    }

    function addAuth(address addr) public onlyOwner {
        authInfo[addr] = true;
    }

    function removeAuth(address addr) public onlyOwner {
        authInfo[addr] = false;
    }

    function authOf(address _addr) public view returns (bool){
        return authInfo[_addr] || msg.sender == owner();
    }

    function multiAddAuth(address[] memory addr) public onlyOwner {
        for (uint256 i = 0; i < addr.length; i++) {
            authInfo[addr[i]] = true;
        }
    }
}

// File: contracts/util/UnBoundedList.sol

pragma solidity 0.6.9;

//==========================================================
// Author: Alexander Zammit
// Date: 18th May 2020
// LinkedIn: https://www.linkedin.com/in/alexzammit/
//
// This code is documented in the article:
//
// Designing an Unbounded List in Solidity
// http://blockchainthings.io/article.aspx?i=4
//
//==========================================================


contract ListContract is Auth {

    struct ListElement {
        uint256 prev;           //Previous list item pointer
        uint256 next;           //Next list item pointer
        address addr;           //Item data
    }

    uint256 public nextItem;    //Id of next Item to be created, Ids are assigned sequentially
    uint256 public totalItems;  //Number of listed Items

    //Item storage. id => ListElement
    mapping(uint256 => ListElement) private items;

    //Events
    event EventItemAdded(uint256 indexed id, address addr);
    event EventItemDeleted(uint256 indexed id, address addr);

    /// @dev Initializes ListContract
    constructor() public {
        //Id zero is reserved.
        //First item to be created will have id 1
        nextItem = 1;
    }

    /// @dev Add list item.
    /// @param addr list item data
    function add(address addr) external auth returns (uint256){
        //Validate item data
        require(addr != address(0x0), "Address cannot be zero");

        ListElement storage prevElem = items[lastItem()];
        ListElement storage newElem = items[nextItem];
        uint256 res = nextItem;
        prevElem.next = nextItem;
        newElem.prev = lastItem();
        newElem.addr = addr;

        lastItemSet(nextItem);
        nextItem += 1;
        totalItems += 1;

        emit EventItemAdded(lastItem(), addr);
        return res;
    }

    /// @dev Remove list item with given id
    /// @param id element to be removed
    function remove(uint256 id) external auth {
        ListElement storage elem = items[id];

        //Make sure we are deleting a valid item i.e. an item that is actually in the list
        //Note this will also block deleting the root node (id == 0)
        require(elem.addr != address(0x0), "Uninitialized Item cannot be deleted");

        //Add log for deleted item
        emit EventItemDeleted(id, elem.addr);

        //Update the previous list entry
        ListElement storage prevElem = items[elem.prev];
        prevElem.next = elem.next;

        //If deleted elem was the list tail than update lastItem
        //to point at the prev element
        if (elem.next == 0) {
            lastItemSet(elem.prev);
        }
        else {
            ListElement storage nextElem = items[elem.next];
            nextElem.prev = elem.prev;
        }

        //Delete element
        delete items[id];
        totalItems -= 1;
    }

    /// @dev Update list item with given id
    /// @param id element to be updated
    function update(uint256 id, address addr) external auth {
        //Validate new item data
        require(addr != address(0x0), "Address cannot be zero");

        //Validate id is pointing to a valid list item element
        ListElement storage elem = items[id];
        require(elem.addr != address(0x0), "Uninitialized Item cannot be updated");

        //Update item data
        elem.addr = addr;
    }

    /// @dev Reads up to <toRead> items starting from the element with id start
    /// It is up to the caller to make sure that he doesn't ask for too many
    /// items such that to run out of memory
    /// @param start specify the starting id for reading items. start = 0 => list head
    /// @param toRead number of items to read. toRead = 0 => read all items up to the end
    /// @return addrList - an array of item data, next - next reading position (next == 0 indicates we reached the list end)
    function read(uint256 start, uint256 toRead) public view returns (address[] memory addrList, uint256 next) {

        //start = 0 => list head
        uint256 itemPos;
        if (start == 0)
            itemPos = firstItem();
        else itemPos = start;

        //Cater for the special case where the list is empty
        if (itemPos == 0)
            return (new address[](0), 0);

        //Validate reading position
        //This can happen if an item is deleted while traversing the list
        require(items[itemPos].addr != address(0x0), "Invalid reading position.");

        //Determine number of elements to be returned
        //We count until:
        // Hitting the root OR
        // toRead elements are traversed
        uint256 size = 0;
        while ((itemPos != 0) && ((toRead == 0) || (size < toRead))) {
            size += 1;
            itemPos = items[itemPos].next;
        }

        //Return requested items
        addrList = new address[](size);

        if (start == 0)
            itemPos = firstItem();
        else itemPos = start;

        uint256 arrayPos;
        while (arrayPos < size) {
            addrList[arrayPos] = items[itemPos].addr;

            arrayPos += 1;
            itemPos = items[itemPos].next;
        }

        next = itemPos;
    }

    /// @dev Get id of first item in list
    /// @return id of first item
    function firstItem() public view returns (uint256) {
        return items[0].next;
    }

    /// @dev Get id of last item in list
    /// @return id of last item
    function lastItem() public view returns (uint256) {
        return items[0].prev;
    }

    /// @dev Set id of last item added
    /// @param id id value to set
    function lastItemSet(uint256 id) private {
        items[0].prev = id;
    }

    function getAddrById(uint256 id) public view returns (address) {
        return items[id].addr;
    }

    function getNextById(uint256 id) public view returns (address) {
        return items[items[id].next].addr;
    }

    function getPrevById(uint256 id) public view returns (address) {
        return items[items[id].prev].addr;
    }
}

// File: contracts/biz/Invite.sol

pragma solidity 0.6.9;
pragma experimental ABIEncoderV2;






contract Invite is Auth {

    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    uint public timeThreshold;
    uint public limitAmount;
    uint public totalRewardThreshold;
    uint public totalReward;
    IERC20 public bmu;

    mapping(address => address) public _superUser;
    mapping(address => uint) public inviteNum;
    // wait fro withdraw
    mapping(address => uint256) public inviteReward;
    // already withdraw
    mapping(address => uint256) public receivedInviteReward;
    mapping(address => bool) public isInviteReward;
    mapping(address => InviteHistory[]) inviteHistory;

    event InviteEvent(address indexed user, address indexed superUser);
    event InviteRewardEvent(address indexed user, address indexed superUser, uint indexed amount);
    event GetReward(address indexed user, uint indexed amount);

    struct InviteHistory {
        address user;
        uint time;
    }

    constructor (uint timeThreshold_, address bmu_) public {
        timeThreshold = timeThreshold_;
        bmu = IERC20(bmu_);
        limitAmount = 10 * 10 ** 18;
        totalRewardThreshold = 50000 * 10 ** 18;
    }

    function setTimeThreshold(uint value) public onlyOwner {
        timeThreshold = value;
    }

    function setLimitAmount(uint value) public onlyOwner {
        limitAmount = value;
    }

    function setTotalRewardThreshold(uint value) public onlyOwner {
        totalRewardThreshold = value;
    }

    function setTotalReward(uint value) public onlyOwner {
        totalReward = value;
    }

    function getReward() public {
        address user = msg.sender;
        require(inviteReward[user] > 0, "No award amount can be claimed");
        require(bmu.balanceOf(address(this)) >= inviteReward[user], "The BMU balance of the contract is insufficient");
        if (timeThreshold > block.timestamp) {
            require(inviteReward[user] >= limitAmount, "The amount received exceeds the limit");
        }
        bmu.safeTransfer(user, inviteReward[user]);
        emit GetReward(user, inviteReward[user]);
        receivedInviteReward[user] = receivedInviteReward[user].add(inviteReward[user]);
        inviteReward[user] = 0;
    }

    function addReward(address user, uint amount) public auth {
        if (totalReward >= totalRewardThreshold) {
            return;
        }
        // Determine if a user has given an invitation to a superior
        if (isInviteReward[user]) {
            return;
        }
        address superior = getSuperUser(user);
        inviteReward[superior] = inviteReward[superior].add(amount);
        isInviteReward[user] = true;
        totalReward = totalReward.add(amount);
        emit InviteRewardEvent(user, superior, amount);
    }

    function bind(address _addr) public {
        require(!Address.isContract(msg.sender), "The msg sender must be a user");
        require(_superUser[msg.sender] == address(0), "Already bind");
        require(msg.sender != _addr, "You can't invite yourself");
        require(_superUser[_addr] != msg.sender, "Invitations cannot be recycled");
        _superUser[msg.sender] = _addr;
        InviteHistory memory invite;
        invite.user = msg.sender;
        invite.time = block.timestamp;
        inviteHistory[_addr].push(invite);
        inviteNum[_addr] = inviteNum[_addr].add(1);
        emit InviteEvent(msg.sender, _addr);
    }

    function getSuperUser(address _addr) public view returns (address) {
        return _superUser[_addr];
    }

    function getCycleBind(address _addr) public view returns (bool){
        return _superUser[_addr] == msg.sender;
    }

    function getInviteNum(address _addr) public view returns (uint) {
        return inviteNum[_addr];
    }

    function listInviteHistory(uint page, uint size) public view returns (InviteHistory[] memory res) {
        require(page >= 1 && size > 0, "The page and size must more than zero");
        uint256 balance = inviteHistory[msg.sender].length;
        require(page.sub(1).mul(size) <= balance, "The page is over");
        uint256 length;
        uint256 begin;
        if (page == 1 && page.mul(size) >= balance) {
            length = balance;
            begin = length.sub(1);
        } else {
            begin = balance.sub(page.sub(1).mul(size)).sub(1);
            length = begin >= size ? size : begin.add(1);
        }
        uint256 end = begin >= size ? begin.sub(size).add(1) : 0;
        res = new InviteHistory[](length);
        uint index;
        for (uint i = begin; i >= end; i--) {
            res[index] = inviteHistory[msg.sender][i];
            index++;
            if (i <= 0) {
                break;
            }
        }
    }

    function getInviteReward(address user) public view returns (uint) {
        return inviteReward[user];
    }

    function getReceivedInviteReward(address user) public view returns (uint) {
        return receivedInviteReward[user];
    }

    function withdrawBmu(address receiver) public onlyOwner {
        bmu.safeTransfer(receiver, bmu.balanceOf(address(this)));
    }

}

// File: contracts/biz/BmuPool.sol

pragma solidity 0.6.9;









// deposit Bmu, get hbtc
contract BmuPool is Auth {
    using SafeERC20 for IERC20;
    using SafeMath for uint256;
    Invite public invite;
    address payable vault;
    IERC20 public bmu;
    IERC20 public hbtc;
    ListContract public userList;
    uint256 public totalDeposit;
    uint256 public totalReward;
    uint256 public lastReward;
    uint256 public avgShare;
    uint256 public rewardNum;
    uint256 public withdrawTime;
    uint256 public startTime;
    // A threshold for the amount of invitations awarded
    uint256 public rewardThreshold;
    // Number of Invitation Bonuses each time
    uint256 public rewardAmountPer;
    bool public contractSwitch;
    mapping(address => uint256) totalRewardOfUser;
    mapping(address => uint256) lastRewardOfUser;
    mapping(address => uint256) amountOfUser;
    mapping(address => uint256) withdrawTimeOfUser;
    mapping(address => uint256) rewardOfUser;
    mapping(address => uint256) rewardNumOfUser;
    mapping(address => uint256) debtOfUser;
    mapping(address => uint256) userIndex;
    RewardHistory[] rewardHistory;

    event depositEvent(address indexed user, uint256 indexed newAmount, uint256 indexed oldAmount);
    event getRewardEvent(address indexed user, uint256 indexed amount);
    event withdrawEvent(address indexed user, uint256 indexed amount);
    event triggerRewardEvent(address indexed user, uint256 indexed amount);

    constructor(
        address bmu_,
        address hbtc_,
        address payable vault_,
        ListContract list_,
        address invite_,
        uint startTime_
    ) public {
        startTime = startTime_;
        bmu = IERC20(bmu_);
        hbtc = IERC20(hbtc_);
        invite = Invite(invite_);
        vault = vault_;
        userList = list_;
        withdrawTime = 7 days;
        rewardThreshold = 5 * 10 ** 18;
        rewardAmountPer = 2 * 10 ** 18;
    }

    struct RewardHistory {
        uint totalReward;
        uint totalDeposit;
        uint perReward;
        uint rewardTime;
    }

    // if transfer ht, open the annotation
    // fallback() external payable {}
    // receive ()  external payable {}

    modifier checkUser {
        address user = msg.sender;
        require(user != address(0), "The user must not be zero");
        require(!Address.isContract(user), "The msg.sender address must be a user");
        _;
    }

    modifier checkSwitch {
        require(!contractSwitch, "The contract closed");
        _;
    }

    modifier checkStartTime {
        require(startTime < block.timestamp, "The contract not start");
        _;
    }

    modifier updateReward {
        address user = msg.sender;
        // The user's mortgage number must be greater than 0
        // and the number of payouts must be less than the number of reward
        if (amountOfUser[user] > 0 && rewardNumOfUser[user] < rewardNum) {
            uint currentReward = avgShare.mul(amountOfUser[user]).div(getBmuDecimals()).sub(debtOfUser[user]);
            totalRewardOfUser[user] = totalRewardOfUser[user] + currentReward;
            lastRewardOfUser[user] = currentReward;
            rewardOfUser[user] = rewardOfUser[user].add(currentReward);
            debtOfUser[user] = debtOfUser[user].add(currentReward);
            rewardNumOfUser[user] = rewardNum;
        }
        _;
    }

    function setWithdrawTime(uint256 value) public onlyOwner {
        withdrawTime = value;
    }

    function setStartTime(uint256 value) public onlyOwner {
        startTime = value;
    }

    function setRewardThreshold(uint256 value) public onlyOwner {
        rewardThreshold = value;
    }

    function setRewardAmountPer(uint256 value) public onlyOwner {
        rewardAmountPer = value;
    }

    // user deposit and calculate reward
    function deposit(uint256 amount) public checkUser checkSwitch updateReward checkStartTime {
        address user = msg.sender;
        require(amount > 0, "The amount must more than 0");
        require(bmu.balanceOf(user) >= amount, "Balance not enough");
        if (amountOfUser[user] <= 0) {
            uint256 index = userList.add(user);
            userIndex[user] = index;
        }
        bmu.safeTransferFrom(user, address(this), amount);
        // update user debt
        debtOfUser[user] = debtOfUser[user].add(avgShare.mul(amount).div(getBmuDecimals()));
        uint oldAmount = amountOfUser[user];
        amountOfUser[user] = oldAmount.add(amount);
        withdrawTimeOfUser[user] = block.timestamp + withdrawTime;
        totalDeposit = totalDeposit.add(amount);
        emit depositEvent(user, amount, oldAmount);

        uint256 newDeposit = amountOfUser[user];
        address superior = invite.getSuperUser(msg.sender);
        // The superior has no collateral money
        if (amountOfUser[superior] <= 0) {
            return;
        }
        if (newDeposit < rewardThreshold) {
            return;
        }
        invite.addReward(msg.sender, rewardAmountPer);

    }
    // user withdraw and calculate reward
    function withdraw(uint256 amount) public checkSwitch updateReward checkStartTime {
        require(amount > 0, "The amount must more than 0");
        address user = msg.sender;
        uint256 userBalance = amountOfUser[user];
        require(amount <= userBalance, "The balance is 0");
        uint256 balance = bmu.balanceOf(address(this));
        require(balance >= amount, "The pool balance not enough");
        require(withdrawTimeOfUser[user] <= block.timestamp, "The withdrawal time has not been reached");
        bmu.safeTransfer(user, amount);
        amountOfUser[user] = amountOfUser[user].sub(amount);
        if (amountOfUser[user] <= 0) {
            debtOfUser[user] = 0;
            userList.remove(userIndex[user]);
            userIndex[user] = 0;
            withdrawTimeOfUser[user] = 0;
        } else {
            debtOfUser[user] = debtOfUser[user].sub(amount.mul(avgShare).div(getBmuDecimals()));
            withdrawTimeOfUser[user] = block.timestamp + withdrawTime;
        }
        totalDeposit = totalDeposit.sub(amount);
        emit withdrawEvent(user, amount);
    }
    // calculate reward
    function reward() public checkSwitch updateReward checkStartTime {
        address user = msg.sender;
        uint amount = rewardOfUser[user];
        require(amount > 0, "You have not reward");
        require(hbtc.balanceOf(address(this)) >= amount, "The balance of contract not enough");
        hbtc.safeTransfer(user, amount);
        rewardOfUser[user] = 0;
        emit getRewardEvent(user, amount);
    }
    // calculate per reward
    function triggerReward(uint256 amount) public checkSwitch checkUser checkStartTime {
        address user = msg.sender;
        require(amount > 0, "The balance is 0");
        uint256 balance = hbtc.balanceOf(user);
        require(balance >= amount, "The user balance not enough");
        hbtc.safeTransferFrom(user, address(this), amount);
        totalReward = totalReward.add(amount);
        lastReward = amount;
        uint currentAvgShare = amount.mul(getBmuDecimals()).div(totalDeposit);
        avgShare = avgShare.add(currentAvgShare);
        rewardNum = rewardNum.add(1);
        RewardHistory memory rh;
        rh.totalReward = amount;
        rh.totalDeposit = totalDeposit;
        rh.perReward = currentAvgShare.mul(1000);
        rh.rewardTime = block.timestamp;
        rewardHistory.push(rh);
        emit triggerRewardEvent(user, amount);
    }
    //
    function listRewardHistory(uint page, uint size) public view returns (RewardHistory[] memory res) {
        if (page < 1 || size <= 0) {
            return res = new RewardHistory[](0);
        }
        uint256 balance = rewardHistory.length;
        if (page.sub(1).mul(size) > balance) {
            return res = new RewardHistory[](0);
        }
        uint256 length;
        uint256 begin;
        if (page == 1 && page.mul(size) >= balance) {
            length = balance;
            begin = length.sub(1);
        } else {
            begin = balance.sub(page.sub(1).mul(size)).sub(1);
            length = begin >= size ? size : begin.add(1);
        }
        uint256 end = begin >= size ? begin.sub(size).add(1) : 0;
        res = new RewardHistory[](length);
        uint index;
        for (uint i = begin; i >= end; i--) {
            res[index] = rewardHistory[i];
            index++;
            if (i <= 0) {
                break;
            }
        }
    }

    function earned(address user) public view returns (uint256) {
        if (amountOfUser[user] > 0 && rewardNumOfUser[user] < rewardNum) {
            uint currentReward = avgShare.mul(amountOfUser[user]).div(getBmuDecimals()).sub(debtOfUser[user]);
            return rewardOfUser[user].add(currentReward);
        }
        return rewardOfUser[user];
    }

    function userDepositBalance(address user) public view returns (uint256) {
        return amountOfUser[user];
    }

    function userTotalReward(address user) public view returns (uint256) {
        return totalRewardOfUser[user];
    }

    function userLastReward(address user) public view returns (uint256) {
        return lastRewardOfUser[user];
    }

    function balanceOfPool() public view returns (uint) {
        return hbtc.balanceOf(address(this));
    }

    function getUserAddr(uint256 begin, uint256 size) public view returns (address[] memory addr, uint256 next) {
        return userList.read(begin, size);
    }

    function getStart() public view returns (uint256) {
        return userList.firstItem();
    }

    function getEnd() public view returns (uint256) {
        return userList.lastItem();
    }

    function getLength() public view returns (uint256) {
        return userList.totalItems();
    }

    function isContainsUser(address user) public view returns (bool) {
        return amountOfUser[user] > 0;
    }

    function balanceOfVault() public view returns (uint) {
        return hbtc.balanceOf(vault);
    }

    function withdrawTimeOf(address user) public view returns (uint) {
        return withdrawTimeOfUser[user];
    }

    function getBmuDecimals() public view returns (uint) {
        return 10 ** uint(ERC20(address(bmu)).decimals());
    }

    function getHbtcDecimals() public view returns (uint) {
        return 10 ** uint(ERC20(address(hbtc)).decimals());
    }

    function getPageLength() public view returns (uint) {
        return rewardHistory.length;
    }

}
