dd: Convert and copy a file
dd copies input to output with a changeable I/O block size, while optionally performing conversions on the data. Synopses:

dd [operand]…
dd option
The only options are --help and --version. See Common options.

By default, dd copies standard input to standard output. To copy, dd repeatedly does the following steps in order:

Read an input block.
If converting via ‘sync’, pad as needed to meet the input block size. Pad with spaces if converting via ‘block’ or ‘unblock’, NUL bytes otherwise.
If ‘bs=’ is given and no conversion mentioned in steps (4) or (5) is given, output the data as a single block and skip all remaining steps.
If the ‘swab’ conversion is given, swap each pair of input bytes. If the input data length is odd, preserve the last input byte (since there is nothing to swap it with).
If any of the conversions ‘swab’, ‘block’, ‘unblock’, ‘lcase’, ‘ucase’, ‘ascii’, ‘ebcdic’ and ‘ibm’ are given, do these conversions. These conversions operate independently of input blocking, and might deal with records that span block boundaries.
Aggregate the resulting data into output blocks of the specified size, and output each output block in turn. Do not pad the last output block; it can be shorter than usual.
dd accepts the following operands, whose syntax was inspired by the DD (data definition) statement of OS/360 JCL.

‘if=file’
Read from file instead of standard input.

‘of=file’
Write to file instead of standard output. Unless ‘conv=notrunc’ is given, truncate file before writing it.

‘ibs=bytes’
Set the input block size to bytes. This makes dd read bytes per block. The default is 512 bytes.

‘obs=bytes’
Set the output block size to bytes. This makes dd write bytes per block. The default is 512 bytes.

‘bs=bytes’
Set both input and output block sizes to bytes. This makes dd read and write bytes per block, overriding any ‘ibs’ and ‘obs’ settings. In addition, if no data-transforming conv operand is specified, input is copied to the output as soon as it’s read, even if it is smaller than the block size.

‘cbs=bytes’
Set the conversion block size to bytes. When converting variable-length records to fixed-length ones (conv=block) or the reverse (conv=unblock), use bytes as the fixed record length.

‘skip=n’
‘iseek=n’
Skip n ‘ibs’-byte blocks in the input file before copying. If n ends in the letter ‘B’, interpret n as a byte count rather than a block count. (‘B’ and the ‘iseek=’ spelling are GNU extensions to POSIX.)

‘seek=n’
‘oseek=n’
Skip n ‘obs’-byte blocks in the output file before truncating or copying. If n ends in the letter ‘B’, interpret n as a byte count rather than a block count. (‘B’ and the ‘oseek=’ spelling are GNU extensions to POSIX.)

‘count=n’
Copy n ‘ibs’-byte blocks from the input file, instead of everything until the end of the file. If n ends in the letter ‘B’, interpret n as a byte count rather than a block count; this is a GNU extension to POSIX. If short reads occur, as could be the case when reading from a pipe for example, ‘iflag=fullblock’ ensures that ‘count=’ counts complete input blocks rather than input read operations. As an extension to POSIX, ‘count=0’ copies zero blocks instead of copying all blocks.

‘status=level’
Specify the amount of information printed. If this operand is given multiple times, the last one takes precedence. The level value can be one of the following:

‘none’
Do not print any informational or warning messages to standard error. Error messages are output as normal.

‘noxfer’
Do not print the final transfer rate and volume statistics that normally make up the last status line.

‘progress’
Print the transfer rate and volume statistics on standard error, when processing each input block. Statistics are output on a single line at most once every second, but updates can be delayed when waiting on I/O.

Transfer information is normally output to standard error upon receipt of the ‘INFO’ signal or when dd exits, and defaults to the following form in the C locale:

7287+1 records in
116608+0 records out
59703296 bytes (60 MB, 57 MiB) copied, 0.0427974 s, 1.4 GB/s
The notation ‘w+p’ stands for w whole blocks and p partial blocks. A partial block occurs when a read or write operation succeeds but transfers less data than the block size. An additional line like ‘1 truncated record’ or ‘10 truncated records’ is output after the ‘records out’ line if ‘conv=block’ processing truncated one or more input records.

The ‘status=’ operand is a GNU extension to POSIX.

‘conv=conversion[,conversion]…’
Convert the file as specified by the conversion argument(s). (No spaces around any comma(s).)

Conversions:

‘ascii’
Convert EBCDIC to ASCII, using the conversion table specified by POSIX. This provides a 1:1 translation for all 256 bytes. This implies ‘conv=unblock’; input is converted to ASCII before trailing spaces are deleted.

‘ebcdic’
Convert ASCII to EBCDIC. This is the inverse of the ‘ascii’ conversion. This implies ‘conv=block’; trailing spaces are added before being converted to EBCDIC.

‘ibm’
This acts like ‘conv=ebcdic’, except it uses the alternate conversion table specified by POSIX. This is not a 1:1 translation, but reflects common historical practice for ‘~’, ‘[’, and ‘]’.

The ‘ascii’, ‘ebcdic’, and ‘ibm’ conversions are mutually exclusive. If you use any of these conversions, you should also use the ‘cbs=’ operand.

‘block’
For each line in the input, output ‘cbs’ bytes, replacing the input newline with a space and truncating or padding input lines with spaces as necessary.

‘unblock’
Remove any trailing spaces in each ‘cbs’-sized input block, and append a newline.

The ‘block’ and ‘unblock’ conversions are mutually exclusive. If you use either of these conversions, you should also use the ‘cbs=’ operand.

‘lcase’
Change uppercase letters to lowercase.

‘ucase’
Change lowercase letters to uppercase.

The ‘lcase’ and ‘ucase’ conversions are mutually exclusive.

‘sparse’
Try to seek rather than write NUL output blocks. On a file system that supports sparse files, this will create sparse output when extending the output file. Be careful when using this conversion in conjunction with ‘conv=notrunc’ or ‘oflag=append’. With ‘conv=notrunc’, existing data in the output file corresponding to NUL blocks from the input, will be untouched. With ‘oflag=append’ the seeks performed will be ineffective. Similarly, when the output is a device rather than a file, NUL input blocks are not copied, and therefore this conversion is most useful with virtual or pre zeroed devices.

The ‘sparse’ conversion is a GNU extension to POSIX.

‘swab’
Swap every pair of input bytes.

‘sync’
Pad every input block to size of ‘ibs’ with trailing zero bytes. When used with ‘block’ or ‘unblock’, pad with spaces instead of zero bytes.

The following “conversions” are really file flags and don’t affect internal processing:

‘excl’
Fail if the output file already exists; dd must create the output file itself.

‘nocreat’
Do not create the output file; the output file must already exist.

The ‘excl’ and ‘nocreat’ conversions are mutually exclusive, and are GNU extensions to POSIX.

‘notrunc’
Do not truncate the output file.

‘noerror’
Continue after read errors.

‘fdatasync’
Synchronize output data just before finishing, even if there were write errors. This forces a physical write of output data, so that even if power is lost the output data will be preserved. If neither this nor ‘fsync’ are specified, output is treated as usual with file systems, i.e., output data and metadata may be cached in primary memory for some time before the operating system physically writes it, and thus output data and metadata may be lost if power is lost. See sync: Synchronize cached writes to persistent storage. This conversion is a GNU extension to POSIX.

‘fsync’
Synchronize output data and metadata just before finishing, even if there were write errors. This acts like ‘fdatasync’ except it also preserves output metadata, such as the last-modified time of the output file; for this reason it may be a bit slower than ‘fdatasync’ although the performance difference is typically insignificant for dd. This conversion is a GNU extension to POSIX.

‘iflag=flag[,flag]…’
Access the input file using the flags specified by the flag argument(s). (No spaces around any comma(s).)

‘oflag=flag[,flag]…’
Access the output file using the flags specified by the flag argument(s). (No spaces around any comma(s).)

Here are the flags.

‘append’
Write in append mode, so that even if some other process is writing to this file, every dd write will append to the current contents of the file. This flag makes sense only for output. If you combine this flag with the ‘of=file’ operand, you should also specify ‘conv=notrunc’ unless you want the output file to be truncated before being appended to.

‘cio’
Use concurrent I/O mode for data. This mode performs direct I/O and drops the POSIX requirement to serialize all I/O to the same file. A file cannot be opened in CIO mode and with a standard open at the same time.

‘direct’
Use direct I/O for data, avoiding the buffer cache. The kernel may impose restrictions on read or write buffer sizes. For example, with an ext4 destination file system and a Linux-based kernel, using ‘oflag=direct’ will cause writes to fail with EINVAL if the output buffer size is not a multiple of 512.

‘directory’
Fail unless the file is a directory. Most operating systems do not allow I/O to a directory, so this flag has limited utility.

‘dsync’
Use synchronized I/O for data. For the output file, this forces a physical write of output data on each write. For the input file, this flag can matter when reading from a remote file that has been written to synchronously by some other process. Metadata (e.g., last-access and last-modified time) is not necessarily synchronized.

‘sync’
Use synchronized I/O for both data and metadata.

‘nocache’
Request to discard the system data cache for a file. When count=0 all cached data for the file is specified, otherwise the cache is dropped for the processed portion of the file. Also when count=0, failure to discard the cache is diagnosed and reflected in the exit status.

Because data not already persisted to storage is not discarded from the cache, the ‘sync’ conversions in the following examples maximize the effectiveness of the ‘nocache’ flag.

Here are some usage examples:

# Advise to drop cache for whole file
dd if=ifile iflag=nocache count=0

# Ensure drop cache for the whole file
dd of=ofile oflag=nocache conv=notrunc,fdatasync count=0

# Advise to drop cache for part of file
# The kernel will consider only complete and
# already persisted pages.
dd if=ifile iflag=nocache skip=10 count=10 of=/dev/null

# Stream data using just the read-ahead cache.
# See also the ‘direct’ flag.
dd if=ifile of=ofile iflag=nocache oflag=nocache,sync
‘nonblock’
Use non-blocking I/O.

‘noatime’
Do not update the file’s access timestamp. See File timestamps. Some older file systems silently ignore this flag, so it is a good idea to test it on your files before relying on it.

‘noctty’
Do not assign the file to be a controlling terminal for dd. This has no effect when the file is not a terminal. On many hosts (e.g., GNU/Linux hosts), this flag has no effect at all.

‘nofollow’
Do not follow symbolic links.

‘nolinks’
Fail if the file has multiple hard links.

‘binary’
Use binary I/O. This flag has an effect only on nonstandard platforms that distinguish binary from text I/O.

‘text’
Use text I/O. Like ‘binary’, this flag has no effect on standard platforms.

‘fullblock’
Accumulate full blocks from input. The read system call may return early if a full block is not available. When that happens, continue calling read to fill the remainder of the block. This flag can be used only with iflag. This flag is useful with pipes for example as they may return short reads. In that case, this flag is needed to ensure that a ‘count=’ argument is interpreted as a block count rather than a count of read operations.

These flags are all GNU extensions to POSIX. They are not supported on all systems, and ‘dd’ rejects attempts to use them when they are not supported. When reading from standard input or writing to standard output, the ‘nofollow’ and ‘noctty’ flags should not be specified, and the other flags (e.g., ‘nonblock’) can affect how other processes behave with the affected file descriptors, even after dd exits.

The behavior of dd is unspecified if operands other than ‘conv=’, ‘iflag=’, ‘oflag=’, and ‘status=’ are specified more than once.

The numeric-valued strings above (n and bytes) are unsigned decimal integers that can be followed by a multiplier: ‘b’=512, ‘c’=1, ‘w’=2, ‘xm’=m, or any of the standard block size suffixes like ‘k’=1024 (see Block size). These multipliers are GNU extensions to POSIX, except that POSIX allows bytes to be followed by ‘k’, ‘b’, and ‘xm’. An ‘xm’ can be used more than once in a number. Block sizes (i.e., specified by bytes strings) must be nonzero.

Any block size you specify via ‘bs=’, ‘ibs=’, ‘obs=’, ‘cbs=’ should not be too large – values larger than a few megabytes are generally wasteful or (as in the gigabyte..exabyte case) downright counterproductive or error-inducing.

To process data with offset or size that is not a multiple of the I/O block size, you can use a numeric string n that ends in the letter ‘B’. For example, the following shell commands copy data in 1 MiB blocks between a flash drive and a tape, but do not save or restore a 512-byte area at the start of the flash drive:

flash=/dev/sda
tape=/dev/st0

# Copy all but the initial 512 bytes from flash to tape.
dd if=$flash iseek=512B bs=1MiB of=$tape

# Copy from tape back to flash, leaving initial 512 bytes alone.
dd if=$tape bs=1MiB of=$flash oseek=512B
For failing storage devices, other tools come with a great variety of extra functionality to ease the saving of as much data as possible before the device finally dies, e.g. GNU ddrescue. However, in some cases such a tool is not available or the administrator feels more comfortable with the handling of dd. As a simple rescue method, call dd as shown in the following example: the operand ‘conv=noerror,sync’ is used to continue after read errors and to pad out bad reads with NULs, while ‘iflag=fullblock’ caters for short reads (which traditionally never occur on flash or similar devices):

# Rescue data from an (unmounted!) partition of a failing device.
dd conv=noerror,sync iflag=fullblock </dev/sda1 > /mnt/rescue.img
Sending an ‘INFO’ signal (or ‘USR1’ signal where that is unavailable) to a running dd process makes it print I/O statistics to standard error and then resume copying. In the example below, dd is run in the background to copy 5GB of data. The kill command makes it output intermediate I/O statistics, and when dd completes normally or is killed by the SIGINT signal, it outputs the final statistics.

# Ignore the signal so we never inadvertently terminate the dd child.
# (This is not needed when SIGINFO is available.)
trap '' USR1

# Run dd with the fullblock iflag to avoid short reads
# which can be triggered by reception of signals.
dd iflag=fullblock if=/dev/zero of=/dev/null count=5000000 bs=1000 & pid=$!

# Output stats every second.
while kill -s USR1 $pid 2>/dev/null; do sleep 1; done
The above script will output in the following format:

3441325+0 records in
3441325+0 records out
3441325000 bytes (3.4 GB, 3.2 GiB) copied, 1.00036 s, 3.4 GB/s
5000000+0 records in
5000000+0 records out
5000000000 bytes (5.0 GB, 4.7 GiB) copied, 1.44433 s, 3.5 GB/s
The ‘status=progress’ operand periodically updates the last line of the transfer statistics above.

On systems lacking the ‘INFO’ signal dd responds to the ‘USR1’ signal instead, unless the POSIXLY_CORRECT environment variable is set.

An exit status of zero indicates success, and a nonzero value indicates failure.